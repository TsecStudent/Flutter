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
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.year,
    required this.genre,
    required this.price,
    required this.imageUrl,
  });
}

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Flutter for Beginners',
      author: 'John Doe',
      year: 2021,
      genre: 'Programming',
      price: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'Dart Programming',
      author: 'Jane Smith',
      year: 2020,
      genre: 'Programming',
      price: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'Mastering Flutter',
      author: 'Alice Johnson',
      year: 2022,
      genre: 'Programming',
      price: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'The Art of Flutter',
      author: 'Bob Brown',
      year: 2021,
      genre: 'Design',
      price: 19.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'Understanding Dart',
      author: 'Charlie White',
      year: 2019,
      genre: 'Programming',
      price: 27.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'Advanced Flutter',
      author: 'David Green',
      year: 2023,
      genre: 'Programming',
      price: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Book(
      title: 'Flutter & Firebase',
      author: 'Eve Black',
      year: 2020,
      genre: 'Programming',
      price: 49.99,
      imageUrl: 'https://images.unsplash.com/photo-1726056652663-8f1e42b2fc95?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.network(
                      book.imageUrl,
                      width: 100,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.title,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text('Author: ${book.author}'),
                          Text('Year: ${book.year}'),
                          Text('Genre: ${book.genre}'),
                          Text('Price: \$${book.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
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
