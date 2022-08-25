import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/last_answer_card.dart';
import '../widgets/tile_button.dart';
import '../widgets/toggle_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey[700],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
              child: Row(
                children: [
                  ToggleButton(onToggleCallback: (val) {}),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Switch to Light',
                    style: TextStyle(
                      color: grey[400],
                      letterSpacing: -0.035,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: primaryGradient,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                color: grey[600],
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.history,
                        color: secondaryColor,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LastAnswerCard(
                            title: result == null ? '0' : result.toString(),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.backspace_outlined,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: _buildButtons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      color: grey[600],
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButtonRow('C', '()', '%', '/'),
          _buildButtonRow('7', '8', '9', 'x'),
          _buildButtonRow('4', '5', '6', '-'),
          _buildButtonRow('1', '2', '3', '+'),
          _buildButtonRow('+/-', '0', '.', '='),
        ],
      ),
    );
  }

  Widget _buildButtonRow(
      String first, String second, String third, String fourth) {
    final row = [first, second, third, fourth];

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: row
            .map(
              (text) => TileButton(
                title: text,
                onPressed: () {},
                color: text == '/' || text == 'x' || text == '-' || text == '+'
                    ? primaryColor
                    : text == 'C' || text == '()' || text == '%'
                        ? grey[500]
                        : null,
                gradient: text == '=' ? primaryGradient : null,
              ),
            )
            .toList(),
      ),
    );
  }
}
