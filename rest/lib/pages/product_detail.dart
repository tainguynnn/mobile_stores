import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/buttons/order_button.dart';
import '../widgets/product_detail/detail_attribute.dart';
import '../widgets/screen_title/page_title.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const PageTitle(
              title: 'Products',
            ),
            Column(
              children: [
                SizedBox(
                  width: 228,
                  height: 243,
                  child: Image.network(product.imageUrl),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        product.description,
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
                            child: Text(
                              '${product.id}',
                              style: const TextStyle(
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
                        detail: product.manufacturer,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Category',
                        detail: product.category,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Available units in stock',
                        detail: '${product.quantity}',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DetailAttribute(
                        title: 'Price',
                        detail: '${product.price} USD',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => {Navigator.pop(context)},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(56, 193, 114, 1),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_circle_left),
                                SizedBox(width: 4),
                                Text('Back'),
                              ],
                            ),
                          ),
                          OrderButton(
                            product: product,
                          )
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
