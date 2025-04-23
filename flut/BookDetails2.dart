//Book Details 2//

import 'package:flutter/material.dart';

void main() {
  runApp(BookDetailApp());
}

class BookDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Details Form',
      home: BookDetailForm(),
    );
  }
}

class BookDetailForm extends StatefulWidget {
  @override
  _BookDetailFormState createState() => _BookDetailFormState();
}

enum Category { TW, IA, Or }

class _BookDetailFormState extends State<BookDetailForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _marksController = TextEditingController();
  Category? _selectedCategory;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String category = _selectedCategory != null ? _selectedCategory.toString().split('.').last : 'None';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form Submitted\nCategory: $category'),
        ),
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

  String? _validateMarks(String? value) {
    if (value == null || value.isEmpty) return 'Please enter Marks';
    final number = double.tryParse(value);
    if (number == null || number < 0) {
      return 'Marks must be a positive number';
    }
    return null;
  }

  Widget _buildRadioOption(String label, Category value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<Category>(
          value: value,
          groupValue: _selectedCategory,
          onChanged: (Category? val) {
            setState(() {
              _selectedCategory = val;
            });
          },
        ),
        Text(label),
      ],
    );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => _validateLettersOnly(value, 'Name'),
              ),
              SizedBox(height: 15),

              // Subject
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(labelText: 'Subject'),
                validator: (value) => _validateLettersOnly(value, 'Subject'),
              ),
              SizedBox(height: 15),

              // Category
              Text('Category'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildRadioOption('TW', Category.TW),
                  _buildRadioOption('IA', Category.IA),
                  _buildRadioOption('Or', Category.Or),
                ],
              ),
              SizedBox(height: 15),

              // Marks
              TextFormField(
                controller: _marksController,
                decoration: InputDecoration(labelText: 'Marks'),
                keyboardType: TextInputType.number,
                validator: _validateMarks,
              ),
              SizedBox(height: 25),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
