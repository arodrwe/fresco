import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final String? status;
  final String? meatType;
  final String? error;

  const ResultScreen({
    super.key,
    this.status,
    this.meatType,
    this.error,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Analysis Result"),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2C4A9E),
      ),

      body: Center(
        child: error != null
            ? Text(
                error!,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Meat Type: $meatType",
                    style: const TextStyle(fontSize: 22),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Status: $status",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}