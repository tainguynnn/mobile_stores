import 'package:flutter/material.dart';

import 'buttons/order_button.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 243,
              child: Image.asset('assets/images/iphone14.png'),
            ),
            Text(
              '''P20 Pro 128GB Dual SIM Twilight''',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text('\$899 USD', style: TextStyle(fontWeight: FontWeight.w400)),
            Text('600 Units in stock',
                style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(66, 139, 202, 1),
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
                      Icon(Icons.info_rounded),
                      SizedBox(width: 4), // Add some spacing between icon and text
                      Text('Details'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                OrderButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
