// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DokterPage extends StatelessWidget {
  const DokterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dokter'),
      ),
      body: ListView.builder(
        itemCount: 13,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('dr. arkham rada'),
            subtitle: Text('Spesialis Anak'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/dokterform'),
        child: Icon(Icons.add),
      ),
    );
  }
}
