import 'package:flutter/material.dart';

import '../colors.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key, required this.onToggleCallback})
      : super(key: key);

  final ValueChanged onToggleCallback;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _toggle = false;

  void _toggleButton() {
    setState(() {
      _toggle = !_toggle;
      widget.onToggleCallback(_toggle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
        ),
        child: SizedBox(
          height: 25,
          width: 71,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 25,
                width: 71,
                decoration: BoxDecoration(
                  gradient: primaryGradient,
                  borderRadius: BorderRadius.circular(31.0),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment:
                    _toggle ? Alignment.centerLeft : Alignment.centerRight,
                curve: Curves.decelerate,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Center(
                    child: Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        color: _toggle ? grey[200] : grey[700],
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          _toggleButton();
        },
      ),
    );
  }
}
