import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String data;
  const CustomSnackBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Text(
          data,
        ),
      ),
    );
  }
}
