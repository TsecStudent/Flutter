import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilities App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    );
  }
}

// Shared Drawer Widget
Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.teal),
          child: Text(
            'Utility App',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        ListTile(
          title: Text('Temperature Converter'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => TemperatureConverterPage()),
            );
          },
        ),
        ListTile(
          title: Text('Age Calculator'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AgeCalculatorPage()),
            );
          },
        ),
      ],
    ),
  );
}

// Home redirects to Temperature page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TemperatureConverterPage();
}

// 🌡 Temperature Converter Page
class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  bool _isCelsiusToFahrenheit = true;

  void _convertTemperature() {
    double input = double.tryParse(_controller.text) ?? 0.0;
    double output;

    if (_isCelsiusToFahrenheit) {
      output = input * 9 / 5 + 32;
      _result = "$input °C = ${output.toStringAsFixed(2)} °F";
    } else {
      output = (input - 32) * 5 / 9;
      _result = "$input °F = ${output.toStringAsFixed(2)} °C";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temperature Converter")),
      drawer: buildAppDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(_isCelsiusToFahrenheit ? 'Celsius to Fahrenheit' : 'Fahrenheit to Celsius'),
              value: _isCelsiusToFahrenheit,
              onChanged: (value) => setState(() => _isCelsiusToFahrenheit = value),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Temperature"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text("Convert"),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// 🎂 Age Calculator Page
class AgeCalculatorPage extends StatefulWidget {
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime? _selectedDate;
  String _age = "";

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    if (_selectedDate == null) return;

    final now = DateTime.now();
    int years = now.year - _selectedDate!.year;
    if (now.month < _selectedDate!.month ||
        (now.month == _selectedDate!.month && now.day < _selectedDate!.day)) {
      years--;
    }

    _age = "Your Age is: $years years";
  }

  @override
  Widget build(BuildContext context) {
    final dateText = _selectedDate == null
        ? "No date selected"
        : DateFormat.yMMMMd().format(_selectedDate!);

    return Scaffold(
      appBar: AppBar(title: Text("Age Calculator")),
      drawer: buildAppDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Select Your Birth Date"),
            ),
            SizedBox(height: 20),
            Text("Selected Date: $dateText", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(_age, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
