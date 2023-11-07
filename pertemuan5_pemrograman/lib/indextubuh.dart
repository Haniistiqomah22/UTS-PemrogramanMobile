import 'package:flutter/material.dart';
// ignore: unused_import
import 'hasil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double weight = 0;
  double height = 0;
  double age = 0;
  String gender = 'Pria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Jenis Kelamin:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Pria',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  },
                ),
                Text('Pria'),
                Radio(
                  value: 'Wanita',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as String;
                    });
                  },
                ),
                Text('Wanita'),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Masukkan Berat Badan (kg):'),
            ),
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
            Align(
              alignment: Alignment.center,
              child: Text('Masukkan Tinggi Badan (cm):'),
            ),
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
            Align(
              alignment: Alignment.center,
              child: Text('Usia:'),
            ),
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
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HasilBMI(weight: weight, height: height, kebutuhanKarbohidrat: '', kebutuhanLemak: '', kebutuhanProtein: '',),
                  ),
                  );
                // Tambahkan logika untuk melihat hasil atau tindakan yang sesuai di sini
              },
              child: Text('Lihat Hasil'),
            ),
          ],
        ),
      ),
    );
  }
}
