// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_element

import 'package:flutter/material.dart';

class DokterformPage extends StatefulWidget {
  const DokterformPage({Key? key}) : super(key: key);
  @override
  _DokterformPageState createState() => _DokterformPageState();
}

class _DokterformPageState extends State<DokterformPage> {
  TextEditingController _namaController = TextEditingController();
  bool adaError = false;

  void _simpanData() {
    var nama = _namaController.text;
    if (nama == "") {
      setState(() {
        adaError = true;
      });
      return;
    }
    setState(() {
      adaError = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Data $nama berhasil disimpan"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Dokter'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Tambah Dokter',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: "Nama Dokter",
                  errorText: adaError ? 'Data tidak boleh kosong' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _simpanData(),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                ),
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
