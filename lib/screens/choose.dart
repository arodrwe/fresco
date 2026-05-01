import 'package:flutter/material.dart';
import 'loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  final String piUrl = "http://192.168.1.22:5000/get-freshness";

  String? selectedMeat;

  Widget meatButton(String meat) {

    bool isSelected = selectedMeat == meat;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMeat = meat;
        });
      },

      child: Container(
        width: 220,
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2C4A9E) : Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: const Color(0xFF2C4A9E),
            width: 2,
          ),
        ),

        child: Center(
          child: Text(
            meat.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF2C4A9E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> startAnalyzing() async {

  if (selectedMeat == null) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select a meat type first."),
      ),
    );

    return;
  }

  /// Show loading screen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoadingScreen(meatType: selectedMeat!),
    ),
  );

  try {

    final response = await http
        .get(Uri.parse("$piUrl?type=$selectedMeat"))
        .timeout(const Duration(seconds: 15));

    if (!mounted) return;

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            status: data['status'],
            meatType: data['meat_type'],
            error: null,
          ),
        ),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultScreen(
            status: null,
            meatType: null,
            error: "Failed to analyze meat",
          ),
        ),
      );

    }

  } catch (e) {

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultScreen(
          status: null,
          meatType: null,
          error: "Failed to connect to Raspberry Pi",
        ),
      ),
    );

  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      appBar: AppBar(
        title: const Text("Choose Meat"),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2C4A9E),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "SELECT MEAT TYPE",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4A9E),
              ),
            ),

            const SizedBox(height: 40),

            meatButton("chicken"),
            meatButton("beef"),
            meatButton("pork"),

            const SizedBox(height: 50),

            SizedBox(
              width: 240,
              height: 60,
              child: ElevatedButton(
                onPressed: startAnalyzing,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C4A9E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  "START ANALYZING",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}