import 'package:flutter/material.dart';

class HasilBMI extends StatelessWidget {
  final double weight;
  final double height;
  final String kebutuhanKarbohidrat;
  final String kebutuhanLemak;
  final String kebutuhanProtein;

  HasilBMI({required this.weight,
    required this.height,
    required this.kebutuhanKarbohidrat,
    required this.kebutuhanLemak,
    required this.kebutuhanProtein,});

  @override
  Widget build(BuildContext context) {
    // Menghitung BMI
    double bmi = weight / (height * height);

    // Kalkulasi kebutuhan karbohidrat, lemak, dan protein 
    String kebutuhanKarbohidrat = (0.55 * bmi / 4).toStringAsFixed(2); // Membatasi 2 desimal
    String kebutuhanLemak = (0.25 * bmi / 9).toStringAsFixed(2); // Membatasi 2 desimal
    String kebutuhanProtein = (0.20 * bmi / 4).toStringAsFixed(2); // Membatasi 2 desimal

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan BMR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hasil perhitungan BMR berada di angka: $bmi kkal'),
            Text('Kamu memerlukan:'),
            Text('Kebutuhan Karbohidrat sebanyak: $kebutuhanKarbohidrat gram'),
            Text('Kebutuhan Lemak sebanyak: $kebutuhanLemak gram'),
            Text('Kebutuhan Protein sebanyak: $kebutuhanProtein gram'),
          ],
        ),
      ),
    );
  }
}