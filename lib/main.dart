import 'package:flutter/material.dart';
import 'package:latihan_/ui/home.dart';
import 'package:latihan_/ui/lihat_kontak.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daftar Kontak",
      home: Home(),
      routes: {
        'lihat_kontak':(context)=>LihatKontak()
      },
    );
  }
}