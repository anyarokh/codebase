part of 'word_details_bloc.dart';

// базовий клас подій для word details
@immutable
sealed class WordDetailsEvent {}

// подія вибору слова для завантаження деталей
class WordDetailsSelectEvent extends WordDetailsEvent {
  WordDetailsSelectEvent();
}
