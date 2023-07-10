// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  CircleAvatar(
                    backgroundImage: AssetImage("images/profil.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Find",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    " your doctor",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: Colors.grey[200],
                  filled: true,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/dokter');
                      this.sendReq();
                    },
                    child: menuItem("Dokter", Icons.add, Colors.blue),
                  ),
                  menuItem("Dental", Icons.abc, Colors.red),
                  menuItem("Dental", Icons.abc, Colors.green),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuItem("Consultation", Icons.add, Colors.blue),
                  menuItem("Dental", Icons.abc, Colors.pink),
                  menuItem("Dental", Icons.abc, Colors.red),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(bottom: 15),
                    leading: Image.asset(
                      "images/doctor01.jpeg",
                    ),
                    title: Text(
                      "dr. Gilang Segara",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heart - Persahabatan Hostpital',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star_half, color: Colors.yellow),
                            Icon(Icons.star_outline),
                          ],
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Open',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 70, 128),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container menuItem(String titleMenu, IconData iconMenu, Color colorMenu) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorMenu,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Icon(
                  iconMenu,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: -5,
                top: -5,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(43, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
          Text(titleMenu)
        ],
      ),
    );
  }

  void sendReq() async {
    var client = http.Client();
    try {
      var request =
          await client.get(Uri.parse('https://dummyjson.com/products/1'));
      var response = request.body;
      print(response);
    } finally {
      client.close();
    }
  }
}
