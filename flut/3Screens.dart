//3 Screens//

import 'package:flutter/material.dart';

void main() {
  runApp(StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  void navigateToSecondScreen() {
    if (nameController.text.isNotEmpty && mobileController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            name: nameController.text,
            mobile: mobileController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateToSecondScreen,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String name;
  final String mobile;

  SecondScreen({required this.name, required this.mobile});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  void navigateToThirdScreen() {
    if (addressController.text.isNotEmpty && cityController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdScreen(
            name: widget.name,
            mobile: widget.mobile,
            address: addressController.text,
            city: cityController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Address & City')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateToThirdScreen,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String name;
  final String mobile;
  final String address;
  final String city;

  ThirdScreen({required this.name, required this.mobile, required this.address, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 18)),
            Text('Mobile: $mobile', style: TextStyle(fontSize: 18)),
            Text('Address: $address', style: TextStyle(fontSize: 18)),
            Text('City: $city', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
