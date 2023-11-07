import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energi Basal Calculator',
      home: BMRCalculatorer(),
    );
  }
}

class BMRCalculatorer extends StatefulWidget {
  @override
  _BMRCalculatorState createState() => _BMRCalculatorState();
}

class _BMRCalculatorState extends State<BMRCalculatorer> {
  double age = 0;
  double weight = 0;
  double height = 0;
  double bmr = 0;
  String gender = 'Male';
  String activityLevel = 'Sedentary';

  static Map<String, double> activityLevels = {
    'Sedentary': 1.2,
    'Lightly Active': 1.375,
    'Moderately Active': 1.55,
    'Very Active': 1.725,
    'Super Active': 1.9,
  };

  void calculateBMR() {
    if (age > 0 && weight > 0 && height > 0) {
      if (gender == 'Male') {
        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }

      bmr *= activityLevels[activityLevel]!;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energi Basal Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Jenis Kelamin:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  },
                ),
                Text('Pria'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  },
                ),
                Text('wanita'),
              ],
            ),
            Text('Usia:'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    age = double.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Text('Berat Badan (kg):'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    weight = double.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Text('Tinggi Badan (cm):'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    height = double.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Text('Tingkat Aktivitas:'),
            DropdownButton<String>(
              value: activityLevel,
              onChanged: (value) {
                setState(() {
                  activityLevel = value!;
                });
              },
              items: activityLevels.keys.map((key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: calculateBMR,
              child: Text('Hitung Energi Basal'),
            ),
            Text(
              'Energi Basal (BMR): ${bmr.toStringAsFixed(2)} calories/day',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
