//Book Details 3//

import 'package:flutter/material.dart';

void main() {
  runApp(BookListApp());
}

class Book {
  final String name;
  final String author;
  final double price;
  final String imageUrl;

  Book({
    required this.name,
    required this.author,
    required this.price,
    required this.imageUrl,
  });
}

class BookListApp extends StatelessWidget {
  final List<Book> books = [
    Book(
      name: 'Flutter Basics',
      author: 'John Smith',
      price: 29.99,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Dart Deep Dive',
      author: 'Alice Doe',
      price: 25.50,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Mobile UI/UX',
      author: 'Robert Lang',
      price: 18.75,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Data Structures',
      author: 'Nina Paul',
      price: 32.00,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Algorithms 101',
      author: 'Kevin Hart',
      price: 45.00,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Clean Code',
      author: 'Martin Fowler',
      price: 39.90,
      imageUrl: 'https://picsum.photos/500',
    ),
    Book(
      name: 'Design Patterns',
      author: 'Erich Gamma',
      price: 50.25,
      imageUrl: 'https://picsum.photos/300',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Book details')),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(book.imageUrl),
                title: Text(
                  book.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Author: ${book.author}'),
                    Text('Price: \$${book.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
