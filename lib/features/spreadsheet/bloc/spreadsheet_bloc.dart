import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_web_worker_example/features/spreadsheet/data/models/spreadsheet_model.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/data/repositories/spreadsheet_repository.dart';

part 'spreadsheet_event.dart';

part 'spreadsheet_state.dart';

// блокує управління станом для сторінки з таблицею
class SpreadsheetBloc extends Bloc<SpreadsheetEvent, SpreadsheetState> {
  final SpreadsheetRepository repository;

  // ініціалізація блоку з переданим репозиторієм
  SpreadsheetBloc(this.repository) : super(SpreadsheetInitialState()) {
    on<SpreadsheetLoadEvent>(_onLoad);
  }

  // обробка події завантаження даних
  Future<void> _onLoad(
      SpreadsheetLoadEvent event, Emitter<SpreadsheetState> emit) async {
    emit(SpreadsheetLoadingState());

    try {
      // отримання списку з репозиторію
      final aggregatedList = await repository.fetchSpreadsheetData();

      // оновлення стану після успішного завантаження
      emit(SpreadsheetLoadedState(aggregatedList));
    } catch (e, s) {
      // обробка помилки при завантаженні
      debugPrint('Помилка завантаження даних: $e');
      debugPrintStack(stackTrace: s);
      emit(SpreadsheetFailureState(e.toString()));
    }
  }
}
