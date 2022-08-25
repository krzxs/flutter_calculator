import 'package:flutter/material.dart';

import '../colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_dark.png',
              height: 128,
              width: 128,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Flutter Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: grey[100],
                letterSpacing: 0.035,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'A fully functional calculator app\nmade using Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: grey[300],
                letterSpacing: 0.035,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
