// import 'package:flutter/material.dart';
// import 'package:rest/widgets/buttons/order_button.dart';
// import 'package:rest/widgets/list_item.dart';
// import 'package:rest/widgets/screen_title/page_title.dart';
//
// import '../models/product.dart';
//
// class ProductList extends StatelessWidget {
//   ProductList({super.key});
//
//   List<num> items = [3, 3, 3, 3, 3];
//   late Future<List<Product>> futureProducts;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         PageTitle(
//           title: 'Products',
//           subTitle: 'All available products in our store',
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (context, index) => const ListItem()),
//           ),
//         ),
//       ],
//     );
//   }
// }
