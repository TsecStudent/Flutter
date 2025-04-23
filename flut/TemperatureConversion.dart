//Temperature Coversion//

import 'package:flutter/material.dart';

void main() {
  runApp(ConversionAgeApp());
}

class ConversionAgeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature and Age Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temperature and Age Calculator')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Temperature Conversion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TemperaturePage()),
                );
              },
            ),
            ListTile(
              title: Text('Age Calculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeCalculatorPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome! Use the drawer to navigate.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TemperaturePage extends StatefulWidget {
  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final TextEditingController tempController = TextEditingController();
  String convertedTemp = '';

  void convertTemperature() {
    double temp = double.tryParse(tempController.text) ?? 0;
    double result = (temp * 9 / 5) + 32;  // Celsius to Fahrenheit conversion
    setState(() {
      convertedTemp = '$temp°C = ${result.toStringAsFixed(2)}°F';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temperature Conversion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tempController,
              decoration: InputDecoration(
                labelText: 'Enter Temperature in Celsius',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              convertedTemp,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeCalculatorPage extends StatefulWidget {
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  final TextEditingController birthYearController = TextEditingController();
  String age = '';

  void calculateAge() {
    int birthYear = int.tryParse(birthYearController.text) ?? 0;
    int currentYear = DateTime.now().year;
    int calculatedAge = currentYear - birthYear;

    setState(() {
      age = 'Your Age: $calculatedAge years';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Age Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: birthYearController,
              decoration: InputDecoration(
                labelText: 'Enter Your Birth Year',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateAge,
              child: Text('Calculate Age'),
            ),
            SizedBox(height: 20),
            Text(
              age,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
