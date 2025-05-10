import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_web_worker_example/core/router/router.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // градієнтний фон від блакитного до рожевого
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB3D9FF), Color(0xFFF8AFC3)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Л. М. ПОЛЮГА',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  // прямокутник-рамка за текстом
                  Positioned(
                    child: Container(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.65,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                    ),
                  ),
                  // контур тексту (верхній шар)
                  Text(
                    'СЛОВНИК\nУКРАЇНСЬКИХ\nМОРФЕМ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 70, // Adjust size based on screen width
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = Colors.black, // Border color
                    ),
                  ),
                  // заповнений основний текст (нижній шар)
                  Text(
                    'СЛОВНИК\nУКРАЇНСЬКИХ\nМОРФЕМ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 70, // Adjust size based on screen width
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Main text color
                      shadows: [
                        Shadow(
                          offset: Offset(4.0, 3.0), // X and Y offset
                          blurRadius: 0.0, // Blur effect
                          color: Colors.black, // Shadow color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              // кнопка початку
              ElevatedButton(
                onPressed: () {
                  context.router.push(HomeRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: SizedBox(
                  width: 400,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Натисни, щоб почати',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
