import 'package:flutter/material.dart';

class DetailAttribute extends StatelessWidget {
  DetailAttribute({super.key, required this.title, required this.detail});

  String title;
  String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          detail,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
