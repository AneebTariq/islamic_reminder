import 'package:flutter/material.dart';

class DuasView extends StatelessWidget {
  const DuasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Duas View',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}