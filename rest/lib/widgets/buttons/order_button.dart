import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cart_cubit.dart';
import '../../models/product.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (product.quantity < 1) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Error'),
              content: const Text('no units in stock'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
          );
        } else {
          context.read<CartCubit>().addToCart(product);
        }
      },
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
