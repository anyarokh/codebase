part of 'spreadsheet_bloc.dart';

@immutable
sealed class SpreadsheetState extends Equatable {}

// початковий стан - перед завантаженням даних
final class SpreadsheetInitialState extends SpreadsheetState {
  @override
  List<Object?> get props => [];
}

// стан під час завантаження даних
class SpreadsheetLoadingState extends SpreadsheetState {
  @override
  List<Object?> get props => [];
}

// стан, коли дані успішно завантажено
class SpreadsheetLoadedState extends SpreadsheetState {
  SpreadsheetLoadedState(
    this.words,
  );

  final List<SpreadsheetModel> words;

  @override
  List<Object?> get props => [words];
}

// стан, коли виникла помилка під час завантаження даних
class SpreadsheetFailureState extends SpreadsheetState {
  SpreadsheetFailureState(
    this.error,
  );

  final String error;

  @override
  List<Object?> get props => [error];
}
