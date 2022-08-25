import 'package:flutter/material.dart';

import '../colors.dart';

class IconButton extends StatelessWidget {
  const IconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(0.1)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
      ),
      onPressed: onPressed,
      child: icon,
    );
  }
}
