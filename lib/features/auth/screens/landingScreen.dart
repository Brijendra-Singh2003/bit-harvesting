import 'dart:ui';
import 'package:bit_harvesting/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 9,
            ),
            const Text(
              'WELCOME FARMER',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://i.ibb.co/khk0nRK/indian-farmer-clipart-png-image-thumbnail-1639917999.png',
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(
                      mobileNumber: '',
                    ),
                  ),
                );
              },
              child: const Card(
                elevation: 1,
                child: SizedBox(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: Text(
                        'Agree & Continue',
                        style: TextStyle(
                          fontSize: 29,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
          ],
        ),
      ),
    );
  }
}
