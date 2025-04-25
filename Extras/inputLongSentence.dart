import 'dart:io';

void main() {
  print("Enter a long sentence:");
  String sentence = stdin.readLineSync()!;

  print("\nResults:");
  print("Number of characters: ${countCharacters(sentence)}");
  print("Number of words: ${countWords(sentence)}");
  print("Reversed sentence: ${reverseSentence(sentence)}");
}

int countCharacters(String text) {
  return text.length;
}

int countWords(String text) {
  List<String> words = text.trim().split(RegExp(r'\s+'));
  return words.length;
}

String reverseSentence(String text) {
  return text.split('').reversed.join();
}
