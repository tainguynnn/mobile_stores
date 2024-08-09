import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(240, 173, 78, 1),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Set the border radius
        ),
        // Set the button to be square (60x60)
        padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 10), // Remove padding to make it a perfect square
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // Center content inside the button
        children: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 4), // Add some spacing between icon and text
          Text('Order Now'),
        ],
      ),
    );
  }
}
