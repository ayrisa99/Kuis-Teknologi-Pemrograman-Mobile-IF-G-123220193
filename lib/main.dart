import 'package:flutter/material.dart';
// import 'package:kuisif_g/deskripsi.dart';
// import 'package:kuisif_g/home.dart';
// import 'package:kuisif_g/profile.dart';
import 'package:kuisif_g/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
      // home: const Home(),
    );
  }
}
