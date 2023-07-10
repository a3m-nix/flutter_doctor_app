// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/dokterform_page.dart';
import 'package:flutter_doctor_app/my_home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dokter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/dokter': (context) => DokterPage(),
        '/dokterform': (context) => DokterformPage(),
      },
      home: MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}
