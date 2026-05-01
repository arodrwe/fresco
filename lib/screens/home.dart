import 'package:flutter/material.dart';
import 'history.dart';
import 'about.dart';
import 'choose.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "FRESCO",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C4A9E),
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 200),

                /// START ANALYSIS BUTTON
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C4A9E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      "START",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 5), // 🔥 Adjust this

                /// CONNECTION STATUS
                Column(
                  children: const [
                    Text(
                      "Connected",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.battery_full,
                            color: Colors.green, size: 22),
                        SizedBox(width: 0),
                        Text(
                          "100%",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

            /// BOTTOM NAV
            Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF2C4A9E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  /// HISTORY
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const HistoryScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "History",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white70,
                  ),

                  /// ABOUT
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AboutScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "About",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}