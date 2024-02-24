import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade600,
      centerTitle: true,
      title: const Text(
        'Bit Harvesting',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
