import 'package:flutter/material.dart';

class AccountAttribute extends StatelessWidget {
   AccountAttribute({super.key,required this.detail, required this.title});

  String title;
  String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
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
        ),
      ),
    );
  }
}
