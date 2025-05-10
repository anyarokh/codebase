import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width; // отримуємо ширину екрана
    final screenHeight = MediaQuery.sizeOf(context).height; // отримуємо висоту екрана
    return Scaffold(
      body: Stack(
        children: [
          // фон з градієнтом
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
          Align(
            alignment: Alignment.topCenter, // вирівнювання вмісту по центру вгорі
            child: Column(
              mainAxisSize: MainAxisSize.min, // мінімальна висота колонки
              children: [
                Padding(
                  // зовнішні відступи відносно розмірів екрана
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.04,
                  ),
                  child: Container(
                    width: screenWidth * 0.84, // ширина контейнера 84% від ширини екрана
                    height: screenHeight * 0.72, // висота — 72% від висоти екрана
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.04,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // білий фон для основного блоку
                      borderRadius: BorderRadius.circular(20), // закруглення кутів
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24), // внутрішні відступи всередині контейнера
                      child: SingleChildScrollView(
                        // дозволяє прокручувати текст, якщо він не вміщається
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // мінімальна висота колонки
                          crossAxisAlignment: CrossAxisAlignment.start, // вирівнювання по лівому краю
                          children: [
                            // перший абзац тексту
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\Сучасна '''
                              '''українська лексикографія, '''
                              '''відповідаючи вимогам інформаційного суспільства, '''
                              '''характеризується тенденцією цифрового представлення '''
                              '''лексикографічних даних. Керуючись актуальними '''
                              '''завданнями й методами комп'ютерної лінгвістики у '''
                              '''галузі словникарства, студент-бакалавр 4-го курсу '''
                              '''Ярох Анна досліджує морфонологічні процеси в '''
                              ''''"Словнику українських морфем" Л.М. Полюги. Вона '''
                              '''також працює над проєктом його електронної версії, '''
                              '''що сприятиме подальшому розвитку цифрової лексикографії.''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            // другий абзац тексту
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\Важливість '''
                              '''цієї проблеми полягає у необхідності оптимізації '''
                              '''обробки та аналізу мовних даних, що сприятиме '''
                              '''підвищенню ефективності досліджень та розширенню '''
                              '''можливостей користувачів. Складність конвертації '''
                              '''традиційних морфемних словників, таких як '''
                              '''"Морфемний аналіз" Яценка І.Т. та '''
                              ''''"Словник українських морфем" Л.М. Полюги, '''
                              '''обумовлена спеціальним способом подання морфемної '''
                              '''структури слів. Через це актуальним є розроблення '''
                              '''методики й програмного забезпечення для автоматичної '''
                              '''конверсії "Словника українських морфем" у цифровий формат.''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            // мета дослідження з виділенням жирним
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0Мета дослідження ',
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'полягає у створенні електронної версії "Словника українських морфем" '
                                        'Л.М. Полюги з акцентом на морфонологічні процеси.',
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      height: 2,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            // заголовок "Завдання дослідження"
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\Завдання дослідження: ''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            // список завдань
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''дослідити історію розвитку комп’ютерної лексикографії як у світі, так і в Україні; ''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''визначити актуальність комп’ютерної лексикографії, описати її завдання та проблеми;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''розробити концепції інфологічної та даталогічної моделі лексикографічної бази даних, вивчити їх особливості;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''визначити структуру та вихідні дані словника для створення електроної версії;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''дослідити морфонологічні процеси української мови та розробити способи їхньої обробки й інтеграції в електронну систему;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''обрати програмний інструментарій та технології для конвертації словника;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''реалізувати електронну версію словника з урахуванням вимог до структури бази даних, інтерфейсу користувача, пошуку та навігації;''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                            Text(
                              '''\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\➢ '''
                              '''описати труднощі розробки.''',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                height: 2,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                height: 2.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
