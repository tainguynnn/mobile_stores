import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  PageTitle({super.key, required this.title, this.subTitle = ''});

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [
      Text(
        title,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
      ),
    ];

    if (subTitle != '') {
      columnChildren.add(
        Text(
          subTitle,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 18),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
      ),
      child: Center(
        child: Column(
          children: columnChildren,
        ),
      ),
    );
  }

}
