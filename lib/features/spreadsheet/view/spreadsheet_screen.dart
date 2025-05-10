import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_web_worker_example/features/spreadsheet/bloc/spreadsheet_bloc.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/data/repositories/spreadsheet_repository.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/widgets/word_table_screen.dart';
import 'package:flutter_web_worker_example/ui/widgets/custom_back_button.dart';

@RoutePage()
class SpreadsheetScreen extends StatefulWidget {
  const SpreadsheetScreen({
    super.key,
    this.showBackButton = false,
  });

  final bool showBackButton; // змінна для показу/сховання кнопки назад

  @override
  State<SpreadsheetScreen> createState() => _SpreadsheetScreenState();
}

class _SpreadsheetScreenState extends State<SpreadsheetScreen> {
  final _repository = SpreadsheetRepository(); // екземпляр репозиторію для отримання даних

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width; // ширина екрана
    final screenHeight = MediaQuery.sizeOf(context).height; // висота екрана

    return BlocProvider(
      create: (BuildContext context) =>
          SpreadsheetBloc(_repository)..add(SpreadsheetLoadEvent()), // ініціалізуємо BLoC
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB3D9FF), Color(0xFFF8AFC3)],
                ),
              ),
            ),
            if (widget.showBackButton)
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.04,
                        top: (72 + 24) + screenHeight * 0.04,
                        right: screenWidth * 0.04,
                        bottom: 0,
                      ),
                      child: Container(
                        width: screenWidth * 0.84,
                        height: screenHeight * 0.72,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white, // білий фон для таблиці
                          borderRadius: BorderRadius.circular(20), // закруглені кути
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          // основний віджет із таблицею
                          child: WordTableScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.showBackButton)
              Positioned(
                left: screenWidth * 0.08, // позиція кнопки назад
                top: 38,
                child: CustomBackButton(), // кастомна кнопка назад
              ),
            if (!widget.showBackButton)
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.04,
                      ),
                      child: Container(
                        width: screenWidth * 0.84,
                        height: screenHeight * 0.72,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          child: WordTableScreen(), // віджет для таблиці
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
