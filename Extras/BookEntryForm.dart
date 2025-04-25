import 'package:flutter/material.dart';

void main() {
  runApp(BookFormApp());
}

class BookFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Entry Form',
      theme: ThemeData(primarySwatch: Colors.teal),
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
  final _authorController = TextEditingController();
  final _bookController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  // Validators
  String? _validateText(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return '$fieldName must contain only letters and spaces';
    }
    return null;
  }

  String? _validatePositiveInteger(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    final number = int.tryParse(value);
    if (number == null || number < 0) {
      return '$fieldName must be a non-negative number';
    }
    return null;
  }

  String? _validatePositiveDecimal(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    final number = double.tryParse(value);
    if (number == null || number < 0) {
      return '$fieldName must be a non-negative price';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Book details submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _authorController.dispose();
    _bookController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Entry Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Author Name
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author Name'),
                validator: (value) => _validateText(value, 'Author Name'),
              ),
              // Book Name
              TextFormField(
                controller: _bookController,
                decoration: InputDecoration(labelText: 'Book Name'),
                validator: (value) => _validateText(value, 'Book Name'),
              ),
              // Quantity
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
                validator: (value) => _validatePositiveInteger(value, 'Quantity'),
              ),
              // Price
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) => _validatePositiveDecimal(value, 'Price'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
