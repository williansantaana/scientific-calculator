import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ScientificCalculator extends StatefulWidget {
  final VoidCallback toggleTheme;
  const ScientificCalculator({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  ScientificCalculatorState createState() => ScientificCalculatorState();
}

class ScientificCalculatorState extends State<ScientificCalculator> {
  String expression = '0';
  String result = '0';
  bool isScientificMode = false;

  void onButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        expression = '0';
        result = '0';
      } else if (text == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression.replaceAll('×', '*').replaceAll('÷', '/'));
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (expression == '0') {
          expression = text;
        } else {
          expression += text;
        }
      }
    });
  }

  void toggleScientificMode() {
    setState(() {
      isScientificMode = !isScientificMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.swap_horiz),
            onPressed: () {
              Navigator.pushNamed(context, '/conversion');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    expression,
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    result,
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: toggleScientificMode,
                child: Text(isScientificMode ? 'Basic' : 'Scientific'),
              ),
            ],
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                if (isScientificMode) _buildScientificKeyboard(),
                _buildBasicKeyboard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('0'), _buildButton('.'), _buildButton('='), _buildButton('+')
          ],
        ),
      ],
    );
  }

  Widget _buildScientificKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('sin'), _buildButton('cos'), _buildButton('tan'), _buildButton('π')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('√'), _buildButton('^'), _buildButton('ln'), _buildButton('log')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('('), _buildButton(')'), _buildButton('%'), _buildButton('e')
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20),
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
