import 'package:flutter/material.dart';

class PrivacypolicyView extends StatelessWidget {
  const PrivacypolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Privacy Policy View',
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