import 'package:flutter/material.dart';

class TotalTextWidget extends StatelessWidget {
  const TotalTextWidget({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color.fromRGBO(235, 167, 0, 1)),
    );
  }
}
