import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest/pages/home_screen.dart';
import 'package:rest/widgets/cart/cart_table.dart';
import 'package:rest/widgets/screen_title/page_title.dart';

import '../cubit/cart_cubit.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(
          title: 'Cart',
          subTitle: 'All products selected are in your cart',
        ),
        const SizedBox(
          height: 20,
        ),
        const CartTable(),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: 240,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(227, 52, 47, 1),
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
            onPressed: () => context.read<CartCubit>().clearCart(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center content inside the button
              children: [
                Icon(Icons.close_rounded),
                SizedBox(width: 4), // Add some spacing between icon and text
                Text('Clear Cart'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: 240,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(56, 193, 114, 1),
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
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center content inside the button
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 4), // Add some spacing between icon and text
                Text('Check out'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: 240,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(56, 193, 114, 1),
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
            onPressed: () {
              Back(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center content inside the button
              children: [
                Icon(Icons.arrow_circle_left),
                SizedBox(width: 4), // Add some spacing between icon and text
                Text('Continue Shopping'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void Back(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => const HomeScreen());

    Navigator.push(context, route);
  }
}
