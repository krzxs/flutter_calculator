import 'package:flutter/material.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(grey[400]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
        ),
        overlayColor: MaterialStateProperty.all(grey[700]?.withOpacity(0.1)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: grey,
          letterSpacing: -0.035,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
