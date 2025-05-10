part of 'word_search_bloc.dart';

// базовий клас для всіх подій пошуку
@immutable
sealed class WordSearchEvent {}

// подія ініціалізації (початкове завантаження)
class WordSearchInitEvent extends WordSearchEvent {}

// подія зміни тексту пошукового запиту
class WordSearchTextChangeEvent extends WordSearchEvent {
  WordSearchTextChangeEvent(
    this.query,
  );

  final String query; // текст пошукового запиту
}

// подія вибору слова
class WordSearchSelectEvent extends WordSearchEvent {
  WordSearchSelectEvent(
    this.wordModel,
  );

  final WordModel wordModel; // вибране слово
}

// подія для підвантаження наступної сторінки результатів
class WordSearchLoadMoreEvent
    extends WordSearchEvent {}
