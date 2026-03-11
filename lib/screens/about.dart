import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2C4A9E),
      ),
      body: const Center(
        child: Text(""),
      ),
    );
  }
}