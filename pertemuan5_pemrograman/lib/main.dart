import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'registrasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrasiPage(),
                    ),
                  );
                  // Tambahkan logika untuk tombol registrasi di sini
                },
                child: Text(
                  'Registrasi',
                  style: TextStyle(color: Colors.white), // Mengatur warna teks
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Input Email
              Container(
                width: 600, // Mengatur lebar maksimum
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 250, 250, 250),
                  border: Border.all(
                    color: Colors.black, // Warna tepi hitam
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Input Password
              Container(
                width: 600, // Mengatur lebar maksimum
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 252, 252, 252),
                  border: Border.all(
                    color: Colors.black, // Warna tepi hitam
                  ),
                ),
                child: TextField(
                  obscureText: true, // Untuk menyembunyikan karakter password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                  // Tambahkan logika login di sini
                },
                child: Text('Login'),
              ),

              SizedBox(height: 10.0),

              TextButton(
                onPressed: () {
                  
                },
                child: Text('Forget Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}