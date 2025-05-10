import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_web_worker_example/ui/widgets/custom_back_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_web_worker_example/features/main/view/main_screen.dart';
import 'package:flutter_web_worker_example/features/spreadsheet/view/spreadsheet_screen.dart';
import 'package:flutter_web_worker_example/features/word_search/view/word_search_screen.dart';

@RoutePage() // анотація для автоматичної маршрутизації за допомогою auto_route
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width; // отримання ширини екрана
    final screenHeight = MediaQuery.sizeOf(context).height; // отримання висоти екрана
    final tabWidth = screenWidth * 0.12; // ширина однієї вкладки (Tab)

    return Scaffold(
      extendBody: true, // дозволяє вмісту тіла розширюватися під нижню панель, якщо вона є
      backgroundColor: Colors.transparent, // фон прозорий, тому що фон задається в Container нижче
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Color(0xFFB3D9FF),
        ),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: (screenWidth - tabWidth * 3) / 2, // центроване розміщення вкладок
                      top: 24,
                      right: (screenWidth - tabWidth * 3) / 2,
                      bottom: 0,
                    ),
                    child: SizedBox(
                      height: 72,
                      width: tabWidth * 3, // загальна ширина всіх трьох вкладок
                      child: TabBar(
                        isScrollable: false, // заборона прокрутки, бо всі вкладки поміщаються
                        indicatorColor: Color(0xFF4A515C), // колір індикатора активної вкладки
                        indicatorWeight: 3, // товщина індикатора
                        labelPadding: EdgeInsets.zero, // прибрані відступи між вкладками
                        tabs: [
                          SizedBox(
                            width: tabWidth, // перша вкладка "Головна"
                            child: Tab(
                              child: Text(
                                'Головна',
                                style: GoogleFonts.roboto(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A515C),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: tabWidth, // друга вкладка "Пошук"
                            child: Tab(
                              child: Text(
                                'Пошук',
                                style: GoogleFonts.roboto(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A515C),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: tabWidth, // третя вкладка "Таблиця"
                            child: Tab(
                              child: Text(
                                'Таблиця',
                                style: GoogleFonts.roboto(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A515C),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.08, // позиціювання кнопки "назад"
                    top: 38,
                    child: CustomBackButton(), // кастомна кнопка повернення назад
                  ),
                ],
              ),
              Expanded(
                child: const TabBarView(
                  children: [
                    MainScreen(), // контент для вкладки "Головна"
                    WordSearchScreen(), // контент для вкладки "Пошук"
                    SpreadsheetScreen(
                      showBackButton: false, // контент для вкладки "Таблиця", без кнопки "назад"
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
