import 'package:flutter/material.dart';

void main() {
  runApp(BookListApp());
}

class BookListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BookList(),
    );
  }
}

class Book {
  final String title;
  final String author;
  final int year;
  final String genre;
  final double price;

  Book({required this.title, required this.author, required this.year, required this.genre, required this.price});
}

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Flutter for Beginners',
      author: 'John Doe',
      year: 2021,
      genre: 'Programming',
      price: 29.99,
    ),
    Book(
      title: 'Dart Programming',
      author: 'Jane Smith',
      year: 2020,
      genre: 'Programming',
      price: 24.99,
    ),
    Book(
      title: 'Mastering Flutter',
      author: 'Alice Johnson',
      year: 2022,
      genre: 'Programming',
      price: 34.99,
    ),
    Book(
      title: 'The Art of Flutter',
      author: 'Bob Brown',
      year: 2021,
      genre: 'Design',
      price: 19.99,
    ),
    Book(
      title: 'Understanding Dart',
      author: 'Charlie White',
      year: 2019,
      genre: 'Programming',
      price: 27.99,
    ),
    Book(
      title: 'Advanced Flutter',
      author: 'David Green',
      year: 2023,
      genre: 'Programming',
      price: 39.99,
    ),
    Book(
      title: 'Flutter & Firebase',
      author: 'Eve Black',
      year: 2020,
      genre: 'Programming',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(book.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Author: ${book.author}'),
                    Text('Year: ${book.year}'),
                    Text('Genre: ${book.genre}'),
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
