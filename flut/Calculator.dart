//Calculator Flutter//

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Import the math_expressions package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = ''; // Store the input string
  String output = ''; // Store the result of calculations

  // Function to handle button press
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        output = '';
      } else if (buttonText == '=' && input.isNotEmpty) {
        try {
          output = _calculate(input);
        } catch (e) {
          output = 'Error';
        }
      } else {
        input += buttonText;
      }
    });
  }

  // Function to evaluate the expression
  String _calculate(String input) {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(input);
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  // Build the calculator UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: [
          // Display the input and output
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Calculator buttons
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: EdgeInsets.all(20),
              itemCount: 16,
              itemBuilder: (context, index) {
                String buttonText = ''; // Initialize with a default value
                if (index == 0) {
                  buttonText = '7';
                } else if (index == 1) {
                  buttonText = '8';
                } else if (index == 2) {
                  buttonText = '9';
                } else if (index == 3) {
                  buttonText = '/';
                } else if (index == 4) {
                  buttonText = '4';
                } else if (index == 5) {
                  buttonText = '5';
                } else if (index == 6) {
                  buttonText = '6';
                } else if (index == 7) {
                  buttonText = '*';
                } else if (index == 8) {
                  buttonText = '1';
                } else if (index == 9) {
                  buttonText = '2';
                } else if (index == 10) {
                  buttonText = '3';
                } else if (index == 11) {
                  buttonText = '-';
                } else if (index == 12) {
                  buttonText = 'C';
                } else if (index == 13) {
                  buttonText = '0';
                } else if (index == 14) {
                  buttonText = '=';
                } else if (index == 15) {
                  buttonText = '+';
                }

                return ElevatedButton(
                  onPressed: () => buttonPressed(buttonText),
                  child: Text(buttonText, style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: CircleBorder(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
