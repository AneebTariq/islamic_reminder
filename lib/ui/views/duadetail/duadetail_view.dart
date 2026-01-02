import 'package:flutter/material.dart';

class DuadetailView extends StatelessWidget {
  const DuadetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dua Detail View',
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