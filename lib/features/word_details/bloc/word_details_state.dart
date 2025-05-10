part of 'word_details_bloc.dart';

// базовий клас станів для word details
@immutable
sealed class WordDetailsState extends Equatable {}

// початковий стан
final class WordDetailsInitialState extends WordDetailsState {
  @override
  List<Object?> get props => [];
}

// стан завантаження
class WordDetailsLoadingState extends WordDetailsState {
  @override
  List<Object?> get props => [];
}

// стан після успішного завантаження даних
class WordDetailsLoadedState extends WordDetailsState {
  WordDetailsLoadedState(this.wordModel);

  final SpreadsheetModel wordModel;


  @override
  List<Object?> get props => [wordModel];
}

// стан помилки під час завантаження
class WordDetailsFailureState extends WordDetailsState {
  WordDetailsFailureState(this.exception);

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
