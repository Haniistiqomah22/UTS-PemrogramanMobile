import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Expenditure Calculator',
      home: EnergyExpenditureCalculator(),
    );
  }
}

class EnergyExpenditureCalculator extends StatefulWidget {
  @override
  _EnergyExpenditureCalculatorState createState() => _EnergyExpenditureCalculatorState();
}

class _EnergyExpenditureCalculatorState extends State<EnergyExpenditureCalculator> {
  double age = 0;
  double weight = 0;
  double height = 0;
  String gender = 'Male';
  String activityLevel = 'Sedentary';
  int steps = 0;
  double energyExpenditure = 0;

  static Map<String, double> activityLevels = {
    'Sedentary': 1.2,
    'Lightly Active': 1.375,
    'Moderately Active': 1.55,
    'Very Active': 1.725,
    'Super Active': 1.9,
  };

  void calculateEnergyExpenditure() {
    if (age > 0 && weight > 0 && height > 0) {
      if (gender == 'Male') {
        energyExpenditure = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      } else {
        energyExpenditure = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      }

      energyExpenditure *= activityLevels[activityLevel]!;

      if (steps > 0) {
        energyExpenditure += (steps * 0.04);
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Expenditure Calculator'),
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
            Text('Jumlah Langkah:'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    steps = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: calculateEnergyExpenditure,
              child: Text('Hitung Pengeluaran Energi'),
            ),
            Text(
              'Pengeluaran Energi: ${energyExpenditure.toStringAsFixed(2)} calories/day',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
