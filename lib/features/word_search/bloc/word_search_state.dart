part of 'word_search_bloc.dart';

// базовий клас для всіх станів пошуку
@immutable
sealed class WordSearchState extends Equatable {}

// початковий стан перед завантаженням даних
final class WordInitialState extends WordSearchState {
  @override
  List<Object?> get props => [];
}

// стан, коли відбувається завантаження (пошук)
class WordSearchLoadingState extends WordSearchState {
  @override
  List<Object?> get props => [];
}

// стан із завантаженими словами
class WordSearchLoadedState extends WordSearchState {
  WordSearchLoadedState(
    this.words,
  );

  final List<WordModel> words; // список знайдених слів

  @override
  List<Object?> get props => [words];
}

// стан помилки при пошуку
class WordSearchFailureState extends WordSearchState {
  WordSearchFailureState(
    this.exception,
  );

  final Object? exception; // текст або об'єкт помилки

  @override
  List<Object?> get props => [exception];
}

// стан після вибору слова
class WordSearchSelectedState extends WordSearchState {
  final String wordBasicWord; // обране базове слово

  WordSearchSelectedState(this.wordBasicWord,);

  @override
  List<Object> get props => [wordBasicWord];
}

// стан помилки при виборі слова
class WordSearchSelectedFailureState extends WordSearchState {
  WordSearchSelectedFailureState(
    this.exception,
  );

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
