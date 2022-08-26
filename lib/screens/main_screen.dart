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
  String strExp = '';
  double? result;
  List<double> resultHistory = [];

  bool historyOpened = false;
  bool secondBracket = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [grey[700]!, grey[600]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.5, 0.5],
          ),
        ),
        child: SafeArea(
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
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        strExp,
                        style: TextStyle(
                          color: grey[300],
                          letterSpacing: -0.035,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        result == null ? '' : '$result',
                        style: TextStyle(
                          color: grey[200],
                          letterSpacing: -0.035,
                          fontSize: 64,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: primaryGradient,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
                  color: grey[600],
                  child: Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                          overlayColor: MaterialStateProperty.all(
                              primaryColor.withOpacity(0.1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(16.0)),
                        ),
                        onPressed: () {
                          setState(() {
                            historyOpened = !historyOpened;
                          });
                        },
                        child: const Icon(
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
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  const CircleBorder(),
                                ),
                                overlayColor: MaterialStateProperty.all(
                                    primaryColor.withOpacity(0.1)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(16.0)),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (strExp.isNotEmpty) {
                                    strExp =
                                        strExp.substring(0, strExp.length - 1);
                                  }
                                });
                              },
                              child: const Icon(
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
                child: historyOpened ? _buildHistory() : _buildButtons(),
              ),
            ],
          ),
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
                onPressed: () {
                  setState(() {
                    if (text == '=') {
                    } else if (text == 'C') {
                      strExp = '';
                    } else if (text == '()') {
                      if (secondBracket) {
                        strExp += ')';
                      } else {
                        strExp += '(';
                      }
                      secondBracket = !secondBracket;
                    } else {
                      strExp += text;
                      secondBracket = false;
                    }
                  });
                },
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

  Widget _buildHistory() {
    return Container(
      color: grey[600],
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
