import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(child: Text('Selamat Datang, $username')),
    );
  }
}
