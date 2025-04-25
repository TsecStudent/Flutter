import 'dart:io';

void main() {
  print('🧮 Simple Calculator');
  stdout.write('Enter first number: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter an operator (+, -, *, /): ');
  String operator = stdin.readLineSync()!;

  stdout.write('Enter second number: ');
  double num2 = double.parse(stdin.readLineSync()!);

  double result;

  switch (operator) {
    case '+':
      result = num1 + num2;
      print('Result: $num1 + $num2 = $result');
      break;
    case '-':
      result = num1 - num2;
      print('Result: $num1 - $num2 = $result');
      break;
    case '*':
      result = num1 * num2;
      print('Result: $num1 * $num2 = $result');
      break;
    case '/':
      if (num2 == 0) {
        print('Error: Division by zero is not allowed.');
      } else {
        result = num1 / num2;
        print('Result: $num1 / $num2 = $result');
      }
      break;
    default:
      print('Invalid operator. Please use +, -, *, or /.');
  }
}
