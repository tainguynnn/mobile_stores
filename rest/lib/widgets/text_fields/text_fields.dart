import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obscure});

  final TextEditingController controller;
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
              obscureText: obscure,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              )),
        ),
      ),
    );
  }
}
