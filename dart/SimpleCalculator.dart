//Simple Calculator//

import 'dart:io';

void main() {
  print("Simple Calculator");

  // Taking user input for numbers
  print("Enter the first number:");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  double num2 = double.parse(stdin.readLineSync()!);

  // Displaying operation choices
  print("Choose an operation:");
  print("1. Addition (+)");
  print("2. Subtraction (-)");
  print("3. Multiplication (*)");
  print("4. Division (/)");

  // Taking user input for operation choice
  int choice = int.parse(stdin.readLineSync()!);

  double result;

  // Performing the selected operation
  switch (choice) {
    case 1:
      result = num1 + num2;
      print("Result: $num1 + $num2 = $result");
      break;
    case 2:
      result = num1 - num2;
      print("Result: $num1 - $num2 = $result");
      break;
    case 3:
      result = num1 * num2;
      print("Result: $num1 * $num2 = $result");
      break;
    case 4:
      if (num2 != 0) {
        result = num1 / num2;
        print("Result: $num1 / $num2 = $result");
      } else {
        print("Error! Division by zero.");
      }
      break;
    default:
      print("Invalid choice!");
  }
}
