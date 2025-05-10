import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_web_worker_example/features/spreadsheet/bloc/spreadsheet_bloc.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/data/models/spreadsheet_model.dart';

class WordTableScreen extends StatefulWidget {
  const WordTableScreen({
    super.key,
  });

  @override
  _WordTableScreenState createState() => _WordTableScreenState();
}

class _WordTableScreenState extends State<WordTableScreen> {
  late ScrollController _scrollController; // Контролер для скролінгу

  @override
  // Функція для обробки події скролу
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Ініціалізація контролера скролінгу
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.95) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Фон для контейнера
      child: BlocBuilder<SpreadsheetBloc, SpreadsheetState>( // Вбудовуємо BlocBuilder для оновлення UI
        builder: (context, state) {
          if (state is SpreadsheetLoadingState) {
            // Якщо дані завантажуються
            return Center(child: CircularProgressIndicator());
          } else if (state is SpreadsheetFailureState) {
            // Якщо сталася помилка
            return Center(child: Text('Помилка: ${state.error}'));
          } else if (state is SpreadsheetLoadedState) {
            // Якщо дані успішно завантажено
            final words = state.words;

            return SingleChildScrollView( // Додаємо скролінг
              padding: EdgeInsets.zero,
              controller: _scrollController, // Встановлюємо контролер для скролу
              child: DataTableTheme(
                data: DataTableThemeData(
                  decoration: BoxDecoration(color: Colors.white), // Білий фон для таблиці
                  headingRowColor:
                      WidgetStateProperty.all(Colors.white), // Колір заголовка таблиці
                  dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white; // Колір рядка при виборі
                      }
                      return Colors.white; // Колір за замовчуванням
                    },
                  ),
                ),
                child: Material(
                  color: Colors.white, // Білий фон для матеріалу
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      cardColor: Colors.white,
                      cardTheme: CardTheme(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        margin: EdgeInsets.zero,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .zero,
                          side: BorderSide(
                              color: Colors.white),
                        ),
                      ),
                      dividerColor: Colors.white,
                      dataTableTheme: DataTableThemeData(
                        headingRowColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          // Set color for heading row
                          return Colors.white; // example color
                        }),
                        dataRowColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          // Set color for data rows
                          return Colors.white; // example color
                        }),
                        // Add other customizations here
                      ),
                    ),
                    child: Container(
                      color: Colors.white, // Білий фон для контейнера
                      padding: EdgeInsets.zero,
                      child: PaginatedDataTable(
                        columns: [
                          DataColumn(label: Text('id')),
                          DataColumn(label: Text('basic_word')),
                          DataColumn(label: Text('split_word')),
                          DataColumn(label: Text('morphology_process')),
                          DataColumn(label: Text('meaning')),
                          DataColumn(label: Text('explanation')),
                        ],
                        source: _WordDataTableSource(words),
                        // Кількість рядків на сторінці
                        rowsPerPage: 10,
                        horizontalMargin: 16,
                        headingRowColor: WidgetStateProperty.all(Colors.white),
                        arrowHeadColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Text('Немає даних'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Очищуємо контролер скролу при виході з екрану
    super.dispose();
  }
}

class _WordDataTableSource extends DataTableSource {
  final List<SpreadsheetModel> words;

  _WordDataTableSource(this.words);

  @override
  DataRow getRow(int index) {
    if (index >= words.length) {
      return DataRow(
        cells: [
          DataCell(Text('-')), // Заповнюємо порожні дані
          DataCell(Text('-')),
          DataCell(Text('-')),
          DataCell(Text('-')),
          DataCell(Text('-')),
        ],
      );
    }
    final word = words[index];

    return DataRow(
      cells: [
        DataCell(Text(word.wordModel.wordId.toString())),
        DataCell(Text(word.wordModel.wordBasicWord ?? "-")),
        DataCell(Text(word.wordModel.wordSplitWord ?? '-')),
        DataCell(Text(word.info?.morphology_process ?? '-')),
        DataCell(Text(word.info?.meaning ?? '-')),
        DataCell(Text(word.info?.explanation ?? '-')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => words.length; // Кількість рядків у таблиці

  @override
  int get selectedRowCount => 0; // Кількість вибраних рядків
}
