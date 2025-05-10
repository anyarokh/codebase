part of 'spreadsheet_bloc.dart';

@immutable
sealed class SpreadsheetEvent {}

// подія для ініціалізації завантаження таблиці з репозиторія
class SpreadsheetLoadEvent extends SpreadsheetEvent {}
