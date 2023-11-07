// ignore_for_file: unused_field, duplicate_ignore

import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

// ignore: duplicate_ignore
class _RegistrasiPageState extends State<RegistrasiPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _nama = '';
  int _umur = 0;
  String _jenisKelamin = 'Pria';
  // ignore: unused_field
  double _beratBadan = 0.0;
  // ignore: unused_field
  double _tinggiBadan = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Alamat Email tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama lengkap'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nama = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Lahir'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tanggal Lahir tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Simpan tanggal lahir
                },
              ),
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                items: ['Pria', 'Wanita'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Berat Badan tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _beratBadan = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tinggi Badan (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tinggi Badan tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tinggiBadan = double.parse(value!);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                   
                  }
                },
                child: Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
