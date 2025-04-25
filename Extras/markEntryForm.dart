import 'package:flutter/material.dart';

void main() {
  runApp(MarkFormApp());
}

class MarkFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark Entry Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MarkForm(),
    );
  }
}

class MarkForm extends StatefulWidget {
  @override
  _MarkFormState createState() => _MarkFormState();
}

class _MarkFormState extends State<MarkForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _markController = TextEditingController();
  String? _category = 'IA';  // Default category

  // Validator for Name and Subject (Only A-Z and a-z allowed)
  String? _validateText(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return '$fieldName must contain only letters and spaces';
    }
    return null;
  }

  // Validator for Mark (Non-negative number only)
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

  // Form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted successfully! Category: $_category'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _subjectController.dispose();
    _markController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mark Entry Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => _validateText(value, 'Name'),
              ),
              // Subject Field
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(labelText: 'Subject'),
                validator: (value) => _validateText(value, 'Subject'),
              ),
              // Mark Field
              TextFormField(
                controller: _markController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Mark'),
                validator: (value) => _validatePositiveInteger(value, 'Mark'),
              ),
              // Category Selection (Radio Buttons)
              Row(
                children: <Widget>[
                  Text('Category: ', style: TextStyle(fontSize: 16)),
                  Radio<String>(
                    value: 'IA',
                    groupValue: _category,
                    onChanged: (String? value) {
                      setState(() {
                        _category = value;
                      });
                    },
                  ),
                  Text('IA'),
                  Radio<String>(
                    value: 'TW',
                    groupValue: _category,
                    onChanged: (String? value) {
                      setState(() {
                        _category = value;
                      });
                    },
                  ),
                  Text('TW'),
                  Radio<String>(
                    value: 'Other',
                    groupValue: _category,
                    onChanged: (String? value) {
                      setState(() {
                        _category = value;
                      });
                    },
                  ),
                  Text('Other'),
                ],
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
