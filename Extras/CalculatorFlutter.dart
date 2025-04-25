import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';
  String result = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '=') {
        try {
          // Replace with proper parser for production
          final expression = input.replaceAll('×', '*').replaceAll('÷', '/');
          result = _calculate(expression).toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  double _calculate(String expression) {
    // Basic expression evaluation (no operator precedence)
    List<String> parts = expression.split(RegExp(r'([+\-*/])'));
    double num1 = double.parse(parts[0]);
    String op = expression.replaceAll(RegExp(r'[^+\-*/]'), '').substring(0, 1);
    double num2 = double.parse(parts[1]);

    switch (op) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num2 != 0 ? num1 / num2 : throw Exception('Division by zero');
      default:
        throw Exception('Invalid operator');
    }
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                input,
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 24),
            child: Text(
              result,
              style: TextStyle(fontSize: 26, color: Colors.grey[700]),
            ),
          ),
          Divider(),
          Column(
            children: [
              Row(
                children: ['7', '8', '9', '÷'].map(buildButton).toList(),
              ),
              Row(
                children: ['4', '5', '6', '×'].map(buildButton).toList(),
              ),
              Row(
                children: ['1', '2', '3', '-'].map(buildButton).toList(),
              ),
              Row(
                children: ['C', '0', '=', '+'].map(buildButton).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
