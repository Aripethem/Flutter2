// ignore_for_file: non_constant_identifier_names

//import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas2/presentation/screen/book_screen/page/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();

  //   // Membuat timer dengan durasi 3 detik
  //   Timer(Duration(seconds: 10), () {
  //     // Pindah ke halaman baru setelah timer berakhir
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => MenuPage()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.lightBlueAccent[700],
        backgroundColor: Colors.lightBlueAccent[400],
        centerTitle: true,
        title: const Text("Projek Tugas Kedua Bootcamp Flutter"),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/utama.png'),
                fit: BoxFit.cover),
          ),
          child: const Center(
            child: Text(
              'Selamat Datang',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )),
      floatingActionButton: FloatingActionButton(
          tooltip: "Klik ya",
          elevation: 0.0,
          child: const Icon(Icons.ads_click),
          backgroundColor: Colors.redAccent[700],
          splashColor: Colors.yellow,
          hoverColor: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => MenuPage(),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
