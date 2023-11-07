import 'package:flutter/material.dart';
import 'indextubuh.dart';
// ignore: unused_import
import 'energibasal.dart';
// ignore: unused_import
import 'expenditure.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Hallo, Hani Istiqomah',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0), // Warna teks
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari informasi gizi',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Tambahkan logika pencarian di sini
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    color: Color.fromARGB(255, 18, 162, 187), // Warna latar belakang untuk Card
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Index Masa Tubuh',
                            style: TextStyle(color: Colors.white), // Warna teks dalam Card
                          ),
                          subtitle: Text('Ketahui status gizimu melalui perbandingan berat dan tinggi badan', style: TextStyle(color: Colors.white)), // Warna teks dalam Card
                        ),
                        Align(
                          alignment: Alignment.bottomLeft, // Meletakkan tombol di kiri bawah
                          child: ElevatedButton(
                            onPressed: () {
                              // Tambahkan logika tombol di sini
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BMICalculator(),
                                ),
                              );
                            },
                            child: Text('Cek Sekarang', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(primary: Colors.blue), // Warna tombol
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(255, 179, 57, 41), // Warna latar belakang untuk Card
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Energi Basal',
                            style: TextStyle(color: Colors.white), // Warna teks dalam Card
                          ),
                          subtitle: Text('Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh', style: TextStyle(color: Colors.white)), // Warna teks dalam Card
                        ),
                        Align(
                          alignment: Alignment.bottomLeft, // Meletakkan tombol di kiri bawah
                          child: ElevatedButton(
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BMRCalculatorer(),
                                ),
                              );
                              
                            },
                            child: Text('Cek Sekarang', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(primary: Colors.blue), // Warna tombol
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(255, 43, 182, 147), // Warna latar belakang untuk Card
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Energi Expenditure',
                            style: TextStyle(color: Colors.white), // Warna teks dalam Card
                          ),
                          subtitle: Text('Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk mempertahankan kehidupan', style: TextStyle(color: Colors.white)), // Warna teks dalam Card
                        ),
                        Align(
                          alignment: Alignment.bottomLeft, // Meletakkan tombol di kiri bawah
                          child: ElevatedButton(
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnergyExpenditureCalculator(),
                                ),
                              );
                              // Tambahkan logika tombol di sini
                            },
                            child: Text('Cek Sekarang', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(primary: Colors.blue), // Warna tombol
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
