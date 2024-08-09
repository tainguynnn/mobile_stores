import 'package:flutter/material.dart';
import 'package:rest/pages/cart.dart';
import 'package:rest/pages/home_screen.dart';
import 'package:rest/pages/product_detail.dart';
import 'package:rest/pages/product_list.dart';
import 'package:rest/todo_list.dart';
import 'package:rest/widgets/bottom_nav.dart';
import 'package:rest/widgets/buttons/order_button.dart';
import 'package:rest/widgets/page_title.dart';

// void main() {
//   runApp(
//     const HomeScreen(),
//   );
// }


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}



// Replace these with your actual screen widgets
