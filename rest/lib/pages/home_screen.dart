import 'package:flutter/material.dart';
import 'package:rest/pages/product_detail.dart';
import 'package:rest/pages/product_list.dart';

import '../widgets/bottom_nav.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate to
  static  List<Widget> _pages = <Widget>[
    ProductList(),
    Cart(),
    ProductDetail(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home,color: Colors.black,),
                Text('Home'),
              ],
            ),
            label: '', // Empty label to avoid duplication
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart,color: Colors.black,),
                Text('Cart'),
              ],
            ),
            label: '', // Empty label to avoid duplication
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.account_circle,color: Colors.black,),
                Text('Account'),
              ],
            ),
            label: '', // Empty label to avoid duplication
          ),
        ],
      ),
    );
  }
}
