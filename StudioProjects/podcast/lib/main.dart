import 'package:flutter/material.dart';
import 'package:podcast/home_screen.dart';
import 'package:podcast/lab_10.dart';
import 'package:podcast/linear_progress.dart';
import 'package:podcast/playing.dart';
import 'package:podcast/validation_screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}