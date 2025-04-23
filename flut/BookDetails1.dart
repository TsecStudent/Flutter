//Book Details 1//

import 'package:flutter/material.dart';

void main() {
  runApp(BookDetailsApp());
}

class BookDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Details Form',
      home: BookForm(),
    );
  }
}

class BookForm extends StatefulWidget {
  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  final _bookNameController = TextEditingController();
  final _authorController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted Successfully!')),
      );
    }
  }

  String? _validateLettersOnly(String? value, String fieldName) {
    if (value == null || value.isEmpty) return 'Please enter $fieldName';
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return '$fieldName should contain only letters';
    }
    return null;
  }

  String? _validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) return 'Please enter $fieldName';
    final number = double.tryParse(value);
    if (number == null || number < 0) {
      return '$fieldName must be a positive number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book details')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Book Name
              TextFormField(
                controller: _bookNameController,
                decoration: InputDecoration(labelText: 'Book Name'),
                validator: (value) => _validateLettersOnly(value, 'Book Name'),
              ),
              SizedBox(height: 15),

              // Author
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) => _validateLettersOnly(value, 'Author'),
              ),
              SizedBox(height: 15),

              // Price
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) => _validatePositiveNumber(value, 'Price'),
              ),
              SizedBox(height: 15),

              // Quantity
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) => _validatePositiveNumber(value, 'Quantity'),
              ),
              SizedBox(height: 25),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
