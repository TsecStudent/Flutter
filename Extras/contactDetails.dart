import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Controllers and variables to store form data
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController dobController = TextEditingController(); // Controller for Date of Birth
  String selectedGender = 'Male';
  String selectedCity = 'New York';

  // Global key for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // City list for the dropdown
  List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];

  // Method to handle submit and navigate to the second screen
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, collect data and navigate to second screen
      final contactDetails = {
        'Name': nameController.text,
        'Gender': selectedGender,
        'Date of Birth': dobController.text, // Display entered date directly
        'Address': addressController.text,
        'City': selectedCity,
        'Pin Code': pinCodeController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(contactDetails),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Details Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // Form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Name field with validation
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              Row(
                children: <Widget>[
                  Text('Gender: '),
                  Radio<String>(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              // Date of Birth field for typing
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth (yyyy-mm-dd)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  // Simple regex validation for date format
                  RegExp dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                  if (!dateRegex.hasMatch(value)) {
                    return 'Enter date in yyyy-mm-dd format';
                  }
                  return null;
                },
              ),
              // Address field with validation
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              // Dropdown for city
              DropdownButtonFormField<String>(
                value: selectedCity,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a city';
                  }
                  return null;
                },
                items: cities.map<DropdownMenuItem<String>>((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
              ),
              // Pin code field with validation
              TextFormField(
                controller: pinCodeController,
                decoration: InputDecoration(labelText: 'Pin Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pin code';
                  }
                  if (value.length != 6) {
                    return 'Pin code must be 6 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Submit button
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

class SecondScreen extends StatelessWidget {
  final Map<String, String> contactDetails;

  SecondScreen(this.contactDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submitted Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contactDetails.entries.map((entry) {
            return Text('${entry.key}: ${entry.value}', style: TextStyle(fontSize: 18));
          }).toList(),
        ),
      ),
    );
  }
}
