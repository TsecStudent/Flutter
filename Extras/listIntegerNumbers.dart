import 'dart:io';

void main() {
  print("Enter a list of integers separated by space:");
  List<int> numbers = stdin.readLineSync()!
      .trim()
      .split(RegExp(r'\s+'))
      .map(int.parse)
      .toList();

  print("\nResults:");
  print("Total: ${getTotal(numbers)}");
  print("Highest number: ${getHighest(numbers)}");
  print("Lowest number: ${getLowest(numbers)}");
  print("Average: ${getAverage(numbers)}");
  print("Median: ${getMedian(numbers)}");
}

int getTotal(List<int> nums) => nums.reduce((a, b) => a + b);

int getHighest(List<int> nums) => nums.reduce((a, b) => a > b ? a : b);

int getLowest(List<int> nums) => nums.reduce((a, b) => a < b ? a : b);

double getAverage(List<int> nums) => getTotal(nums) / nums.length;

double getMedian(List<int> nums) {
  List<int> sorted = List.from(nums)..sort();
  int n = sorted.length;
  if (n % 2 == 1) {
    return sorted[n ~/ 2].toDouble();
  } else {
    return (sorted[n ~/ 2 - 1] + sorted[n ~/ 2]) / 2;
  }
}
