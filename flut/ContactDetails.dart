//Contact Details//

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Details App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContactFormScreen(),
    );
  }
}

class ContactFormScreen extends StatefulWidget {
  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String gender = '';
  String address = '';
  String city = 'Mumbai';
  String pinCode = '';
  DateTime? dob;

  List<String> cities = ['Mumbai', 'Delhi', 'Bangalore', 'Chennai'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value ?? '',
              ),

              // Gender
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Gender'),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value!),
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value!),
                  ),
                  Text('Female'),
                ],
              ),

              // Date of Birth
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Text('Date of Birth: '),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            dob = picked;
                          });
                        }
                      },
                    ),
                    if (dob != null) Text('${dob!.toLocal()}'.split(' ')[0]),
                  ],
                ),
              ),

              // Address
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => address = value ?? '',
              ),

              // City Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'City'),
                value: city,
                items: cities
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) => setState(() => city = value ?? 'Mumbai'),
              ),

              // Pin Code
              TextFormField(
                decoration: InputDecoration(labelText: 'Pin Code'),
                keyboardType: TextInputType.number,
                onSaved: (value) => pinCode = value ?? '',
              ),

              // Submit Button
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          name: name,
                          gender: gender,
                          dob: dob,
                          address: address,
                          city: city,
                          pinCode: pinCode,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  final String gender;
  final DateTime? dob;
  final String address;
  final String city;
  final String pinCode;

  DetailScreen({
    required this.name,
    required this.gender,
    required this.dob,
    required this.address,
    required this.city,
    required this.pinCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All details")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name"),
            Text("Gender: $gender"),
            Text("Date of Birth: ${dob != null ? dob!.toLocal().toString().split(' ')[0] : 'N/A'}"),
            Text("Address: $address"),
            Text("City: $city"),
            Text("Pin Code: $pinCode"),
            Spacer(),
            Center(
              child: ElevatedButton(
                child: Text("BACK"),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
