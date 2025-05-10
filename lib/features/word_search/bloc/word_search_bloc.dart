import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';

import 'package:flutter_web_worker_example/main.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';

part 'word_search_event.dart';

part 'word_search_state.dart';

// BLoC для пошуку слів
class WordSearchBloc extends Bloc<WordSearchEvent, WordSearchState> {
  final int _pageSize = 20; // кількість слів на сторінку
  int _currentPage = 0; // поточна сторінка
  bool _isLoadingMore = false; // прапорець, що вказує, чи триває підвантаження
  String _currentQuery = ''; // поточний пошуковий запит

  WordSearchBloc() : super(WordInitialState()) {
    // реєструємо обробники подій
    on<WordSearchInitEvent>(_onInit);
    on<WordSearchTextChangeEvent>(_onTextChange);
    on<WordSearchSelectEvent>(_onWordSelect);
    on<WordSearchLoadMoreEvent>(_onLoadMore);

    // одразу після створення запускаємо ініціалізацію
    add(WordSearchInitEvent());
  }

  // метод ініціалізації (завантаження першої сторінки)
  Future<void> _onInit(WordSearchInitEvent event, Emitter<WordSearchState> emit) async {
    try {
      _currentPage = 0;
      _currentQuery = ""; // очищаємо пошуковий запит

      final allWords = await _fetchWords(page: _currentPage, query: '');

      emit(WordSearchLoadedState(allWords));
    } catch (e, s) {
      debugPrint('Помилка під час ініціалізації (init bloc): $e');
      debugPrintStack(stackTrace: s);
      emit(WordSearchFailureState(e.toString()));
    }
  }

  // метод обробки зміни пошукового запиту
  Future<void> _onTextChange(
      WordSearchTextChangeEvent event, Emitter<WordSearchState> emit) async {
    debugPrint('Пошуковий запит: ${event.query}');

    _currentQuery = event.query.trim();
    _currentPage = 0; // скидаємо сторінку при новому запиті

    if (_currentQuery.isEmpty) {
      add(WordSearchInitEvent()); // якщо рядок порожній — завантажити стандартні дані
      return;
    }

    emit(WordSearchLoadingState()); // показуємо стан завантаження

    try {
      final searchResults =
          await _fetchWords(page: _currentPage, query: _currentQuery);

      emit(WordSearchLoadedState(searchResults));
    } catch (e, s) {
      debugPrint('Помилка під час пошуку: $e');
      debugPrintStack(stackTrace: s);
      emit(WordSearchFailureState(e.toString()));
    }
  }

  // метод підвантаження наступної сторінки
  Future<void> _onLoadMore(
      WordSearchLoadMoreEvent event, Emitter<WordSearchState> emit) async {
    // якщо вже завантажується або стан не Loaded — нічого не робимо
    if (_isLoadingMore || state is! WordSearchLoadedState) return;

    _isLoadingMore = true;
    debugPrint('Підвантаження нових слів...');

    try {
      _currentPage++;

      final moreWords =
          await _fetchWords(page: _currentPage, query: _currentQuery);

      if (moreWords.isEmpty) {
        debugPrint('Більше слів немає.');
        return;
      }

      final currentState = state as WordSearchLoadedState;
      final updatedWordList = List<WordModel>.from(currentState.words)
        ..addAll(moreWords); // додаємо нові слова до списку

      emit(WordSearchLoadedState(updatedWordList));
    } catch (e, s) {
      debugPrint('Помилка під час підвантаження: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      _isLoadingMore = false; // завершуємо підвантаження
    }
  }

  // обробка вибору слова (не реалізовано)
  Future<void> _onWordSelect(
      WordSearchSelectEvent event, Emitter<WordSearchState> emit) async {}

  // метод отримання слів з бази (з урахуванням сторінки та пошуку)
  Future<List<WordModel>> _fetchWords(
      {required int page, required String query}) async {
    final queryBuilder = database.select(database.wordItems)
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.id)]) // сортування по id
      ..limit(_pageSize);

    if (query.isNotEmpty) {
      // якщо є запит — шукаємо по двох полях
      queryBuilder.where((tbl) =>
          tbl.basic_word.like('%$query%') |
          tbl.split_word.like('%$query%')); // Поиск по двум столбцам
    } else if (page > 0) {
      // якщо це не перша сторінка — фільтруємо по id для пагінації
      queryBuilder.where((tbl) =>
          tbl.id.isBiggerThanValue(page * _pageSize)); // Пагинация без `offset`
    }

    final results = await queryBuilder.get();

    // перетворюємо результати на список моделей
    return results
        .map((e) => WordModel(
            wordId: e.id,
            wordBasicWord: e.basic_word,
            wordSplitWord: e.split_word))
        .toList();
  }
}
