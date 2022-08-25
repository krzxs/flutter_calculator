import 'package:flutter/material.dart';

import '../colors.dart';

class TileButton extends StatelessWidget {
  const TileButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.color,
      this.gradient})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: color == null && gradient == null
              ? grey[700]
              : gradient == null
                  ? color
                  : null,
          gradient: gradient,
          shape: BoxShape.rectangle,
        ),
        height: double.infinity,
        margin: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
            overlayColor:
                MaterialStateProperty.all(color == null && gradient == null
                    ? darken(grey[700]!).withOpacity(0.1)
                    : gradient == null
                        ? darken(color!).withOpacity(0.1)
                        : darken(primaryColor).withOpacity(0.1)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: grey[200],
              letterSpacing: -0.035,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Color darken(Color color, [double amount = .2]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
