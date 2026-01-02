import 'package:flutter/material.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [Color(0xFF0F1E17), Color(0xFF1B3A2A)]
                : const [Color(0xFFF1F8E9), Color(0xFFE8F5E9)],
          ),
        ),
        child: Center(
          child: Text(
            'Theme View',
            style: TextStyle(
              fontSize: 24,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}