import 'package:flutter/material.dart';
import 'package:rest/widgets/detail_attribute.dart';
import '../widgets/buttons/order_button.dart';
import '../widgets/page_title.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            PageTitle(
              title: 'Products',
            ),
            Column(
              children: [
                Container(
                  width: 228,
                  height: 243,
                  child: Image.asset('assets/images/iphone14.png'),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Iphone X',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        '''A smartphone is a handheld personal computer with a mobile operating system and an integrated mobile broadband cellular network connection for voice, SMS, and Internet data communication; most, if not all, smartphones also support Wi-Fi.''',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Item Code:',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(240, 173, 78, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Text(
                              '891721231233912',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Manufacturer',
                        detail: 'Apple',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Category',
                        detail: 'Apple',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Available units in stock',
                        detail: '800',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Price',
                        detail: '1099 USD',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(56, 193, 114, 1),
                              foregroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_circle_left),
                                SizedBox(width: 4),
                                Text('Order Now'),
                              ],
                            ),
                          ),
                          const OrderButton()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
