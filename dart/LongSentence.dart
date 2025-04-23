//Long Sentence//

import 'dart:io';

void main() {
  // Accept a long sentence as input
  print("Enter a long sentence:");
  String sentence = stdin.readLineSync()!;

  // Call the functions
  print("Number of characters: ${getCharacterCount(sentence)}");
  print("Number of words: ${getWordCount(sentence)}");
  print("Sentence in reverse order: ${getSentenceInReverse(sentence)}");
}

// Function to get the number of characters
int getCharacterCount(String sentence) {
  return sentence.length;
}

// Function to get the number of words
int getWordCount(String sentence) {
  // Split the sentence by spaces to count the words
  List<String> words = sentence.split(RegExp(r'\s+'));
  return words.length;
}

// Function to print the sentence in reverse order
String getSentenceInReverse(String sentence) {
  List<String> words = sentence.split(' ');
  words = words.reversed.toList();
  return words.join(' ');
}
