//List of Integers//

import 'dart:io';

void main() {
  // Accept a list of integers as input
  print("Enter a list of numbers separated by spaces:");
  List<int> numbers = stdin.readLineSync()!
      .split(' ')
      .map((e) => int.parse(e))
      .toList();

  // Call the functions
  print("Total of all numbers: ${getTotal(numbers)}");
  print("Highest number: ${getHighest(numbers)}");
  print("Lowest number: ${getLowest(numbers)}");
  print("Average of all numbers: ${getAverage(numbers)}");
  print("Median of numbers: ${getMedian(numbers)}");
}

// Function to get the total of all numbers
int getTotal(List<int> numbers) {
  return numbers.reduce((a, b) => a + b);
}

// Function to get the highest number
int getHighest(List<int> numbers) {
  return numbers.reduce((a, b) => a > b ? a : b);
}

// Function to get the lowest number
int getLowest(List<int> numbers) {
  return numbers.reduce((a, b) => a < b ? a : b);
}

// Function to get the average of all numbers
double getAverage(List<int> numbers) {
  int total = getTotal(numbers);
  return total / numbers.length;
}

// Function to get the median value
double getMedian(List<int> numbers) {
  numbers.sort();
  int length = numbers.length;

  if (length % 2 == 1) {
    // If the length is odd, the median is the middle element
    return numbers[length ~/ 2].toDouble();
  } else {
    // If the length is even, the median is the average of the two middle elements
    return (numbers[(length ~/ 2) - 1] + numbers[length ~/ 2]) / 2.0;
  }
}
