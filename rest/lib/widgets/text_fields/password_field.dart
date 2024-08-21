import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
   PasswordField({super.key,required this.hint, required this.controller});
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
