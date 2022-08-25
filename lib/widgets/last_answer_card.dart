import 'package:flutter/material.dart';

import '../colors.dart';

class LastAnswerCard extends StatelessWidget {
  const LastAnswerCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Text(
          title,
          style: const TextStyle(
            color: secondaryColor,
            letterSpacing: 0.035,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
