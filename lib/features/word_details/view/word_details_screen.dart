import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_web_worker_example/core/router/router.dart';
import 'package:flutter_web_worker_example/features/word_details/bloc/word_details_bloc.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';
import 'package:flutter_web_worker_example/ui/widgets/custom_back_button.dart';

@RoutePage()
class WordDetailsScreen extends StatefulWidget {
  const WordDetailsScreen({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  State<WordDetailsScreen> createState() => _WordDetailsScreenState();
}

class _WordDetailsScreenState extends State<WordDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      // створення bloc і виклик події завантаження
      create: (context) =>
          WordDetailsBloc(widget.wordModel)..add(WordDetailsSelectEvent()),
      child: Scaffold(
        body: BlocBuilder<WordDetailsBloc, WordDetailsState>(
          builder: (context, state) {
            if (state is WordDetailsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WordDetailsFailureState) {
              return Center(child: Text('Помилка: ${state.exception}'));
            } else if (state is WordDetailsLoadedState) {
              // обробка поля morphology_process
              final morphologyProcess =
                  state.wordModel.info?.morphology_process;
              final morphologyProcessNew = (morphologyProcess != null &&
                      morphologyProcess.length > 2)
                  ? morphologyProcess.substring(1, morphologyProcess.length - 1)
                  : null;
              List<String> firstPart = morphologyProcessNew?.split(", ") ?? [];

              // обробка пояснення
              final explanation = state.wordModel.info?.explanation;
              List<String> secondPart = explanation?.split(";") ?? [];

              // обробка значення
              final meaning = state.wordModel.info?.meaning;
              final meaningNew = (meaning != null &&
                      meaning.startsWith('(') &&
                      meaning.endsWith(')'))
                  ? meaning.substring(1, meaning.length - 1)
                  : meaning;
              final thirdPart = meaningNew;

              // побудова тексту з морфонологією та поясненням
              List<TextSpan> textSpans = [];
              for (int i = 0;
                  i < firstPart.length && i < secondPart.length;
                  i++) {
                textSpans.add(
                  TextSpan(
                    text: '(${firstPart[i]}) ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
                textSpans.add(
                  TextSpan(
                    text: '- ${secondPart[i]}\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                );
                textSpans.add(TextSpan(text: '\n'));
              }
              return Stack(
                children: [
                  // фон з градієнтом
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFB3D9FF), Color(0xFFF8AFC3)],
                      ),
                    ),
                  ),
                  // кнопка назад
                  Positioned(
                    left: screenWidth * 0.08,
                    top: 38,
                    child: CustomBackButton(),
                  ),
                  // основна картка з деталями слова
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.32,
                        top: (72 + 24) + screenHeight * 0.04,
                        right: screenWidth * 0.32,
                        bottom: screenHeight * 0.04,
                      ),
                      child: Container(
                        width: screenWidth * 0.84,
                        height: screenHeight * 0.52,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // слово або повідомлення про відсутність
                                Text(
                                  widget.wordModel.wordSplitWord ??
                                      'Цього слова в базі даних немає',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 25),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        if (firstPart.isNotEmpty) ...textSpans,
                                        if (firstPart.isEmpty)
                                          TextSpan(
                                            text:
                                                "Морфонологічного пояснення немає",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        if (thirdPart != null &&
                                            thirdPart.isNotEmpty) ...[
                                          TextSpan(
                                            text: '\nПояснювальна ремарка - ',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: thirdPart,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // кнопка переходу до таблиці
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: screenHeight * 0.1,
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {
                          context.router
                              .push(SpreadsheetRoute(showBackButton: true));
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          side: BorderSide(
                            color: Color(0xFF362A2C),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Подивитися таблицю всіх слів \nз морфологічними процесами',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: screenWidth > 600 ? 20 : 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF362A2C),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
