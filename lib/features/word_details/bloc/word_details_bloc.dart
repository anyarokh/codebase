import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_web_worker_example/features/spreadsheet/data/models/spreadsheet_model.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';
import 'package:flutter_web_worker_example/main.dart';

part 'word_details_event.dart';

part 'word_details_state.dart';

// bloc для отримання деталей слова
class WordDetailsBloc extends Bloc<WordDetailsEvent, WordDetailsState> {
  final WordModel wordModel; // модель вибраного слова

  // ініціалізація bloc з переданою моделлю слова
  WordDetailsBloc(this.wordModel) : super(WordDetailsInitialState()) {
    on<WordDetailsSelectEvent>(_onWordSelected); // реєструємо обробник події вибору слова
  }

  // метод завантаження інформації про слово
  Future<void> _onWordSelected(
      WordDetailsSelectEvent event, Emitter<WordDetailsState> emit) async {
    emit(WordDetailsLoadingState()); // стан завантаження

    try {
      // отримуємо інформацію про слово з бази даних
      final info = (await (database.select(database.alternationItems)
                ..where((tbl) => tbl.wordId.equals(wordModel.wordId)))
              .get())
          .firstOrNull;

      // оновлюємо стан з отриманими даними
      emit(
        WordDetailsLoadedState(
          SpreadsheetModel(
            wordModel: wordModel,
            info: info,
          ),
        ),
      );
    } catch (e, s) {
      debugPrint('Помилка при завантаженні морфонологічної інформації: $e');
      debugPrintStack(stackTrace: s);
      emit(WordDetailsFailureState(e.toString())); // стан помилки
    }
  }
}
