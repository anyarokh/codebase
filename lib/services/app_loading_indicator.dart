import 'package:flutter/material.dart';

import 'package:flutter_web_worker_example/main.dart';
import 'package:flutter_web_worker_example/morphology_app.dart';

// Віджет для відображення індикатора завантаження
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key, // конструктор виджета, передаємо ключ для створення
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // встановлює напрямок тексту зліва направо
      child: Stack( // використовуємо Stack для накладання елементів на інші елементи
        children: [
          const MorphologyApp(), // основний додаток, який відображається на фоні
          ValueListenableBuilder<bool>( // спостерігаємо за зміною значення `isLoadingNotifier`
            valueListenable: isLoadingNotifier, // спостерігаємо за значенням `isLoadingNotifier` (мабуть, визначений у main.dart)
            builder: (context, isLoading, child) { // builder викликається кожен раз, коли значення змінюється
              if (!isLoading) return const SizedBox.shrink(); // якщо завантаження не триває, нічого не відображаємо
              return Positioned( // позиціонуємо індикатор завантаження на екрані
                top: 20, // відступ зверху
                right: 20, // відступ справа
                child: Container( // контейнер для індикатора
                  padding: const EdgeInsets.all(8), // відступи всередині контейнера
                  decoration: BoxDecoration( // стилізація контейнера
                    color: Colors.black54, // напівпрозорий чорний фон
                    borderRadius: BorderRadius.circular(8), // округлені кути
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4), // додаткові відступи всередині контейнера
                    child: const Column( // відображаємо індикатор і текст всередині вертикального контейнера
                      mainAxisSize: MainAxisSize.min, // мінімальний розмір для відображення
                      children: [
                        CircularProgressIndicator( // індикатор завантаження
                          strokeWidth: 2, // товщина кола
                          color: Colors.white, // колір індикатора
                        ),
                        SizedBox(height: 8), // відступ між індикатором і текстом
                        Text( // текст, що інформує про завантаження
                          'Завантаження...',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
