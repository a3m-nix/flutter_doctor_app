// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DokterPage extends StatefulWidget {
  const DokterPage({Key? key}) : super(key: key);

  @override
  _DokterPageState createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dokter'),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listData[index]['title']),
            subtitle: Text(listData[index]['description']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/dokterform'),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    //fetch data api dummy json
    var client = http.Client();
    var request = await client.get(Uri.parse('https://dummyjson.com/products'));
    var responseJson = jsonDecode(request.body);
    var semuaProducts = responseJson['products'];
    setState(() {
      listData = semuaProducts;
    });
  }
}
