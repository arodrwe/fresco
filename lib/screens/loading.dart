import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  final String meatType;

  const LoadingScreen({super.key, required this.meatType});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF2C4A9E),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Analyzing Meat",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C4A9E),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              meatType.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}