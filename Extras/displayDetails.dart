import 'package:flutter/material.dart';

void main() => runApp(StudentFormApp());

class StudentFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstScreen(),
    );
  }
}

// First Screen
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Step 1: Basic Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      name: nameController.text,
                      mobile: mobileController.text,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// Second Screen
class SecondScreen extends StatefulWidget {
  final String name, mobile;

  SecondScreen({required this.name, required this.mobile});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Step 2: Address Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: "City"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
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
              },
            )
          ],
        ),
      ),
    );
  }
}

// Third Screen
class ThirdScreen extends StatelessWidget {
  final String name, mobile, address, city;

  ThirdScreen({
    required this.name,
    required this.mobile,
    required this.address,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Step 3: Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Name: $name", style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text("Mobile: $mobile", style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text("Address: $address", style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text("City: $city", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
