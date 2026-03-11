import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const FrescoApp());
}

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}