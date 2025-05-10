import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<CustomBackButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.maybePop();
      },
      child: MouseRegion(
        cursor:
            SystemMouseCursors.click, // Change the cursor to a pointer (hand)
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.5)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF4A515C),
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF4A515C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
