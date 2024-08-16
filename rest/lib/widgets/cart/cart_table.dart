import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cart_cubit.dart';

class CartTable extends StatelessWidget {
  const CartTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<Map<String, dynamic>>>(
      builder: (context, cartItems) {
        return Column(
          children: [
            Table(
              border: TableBorder.all(color: Colors.transparent),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                const TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(221, 221, 221, 1),
                        width: 1.0,
                      ),
                    ),
                    color: Color.fromRGBO(249, 249, 249, 1),
                  ),
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Product',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ),
                    ),
                    Center(
                        child: Text('Qty',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14))),
                    Center(
                        child: Text('Unit Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14))),
                    Center(
                        child: Text('Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14))),
                  ],
                ),
                for (var item in cartItems)
                  TableRow(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(221, 221, 221, 1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {context.read<CartCubit>().deleteFromCart(item);},
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                              Text(item['name']!),
                            ],
                          ),
                        ),
                      ),
                      Center(child: Text(item['Qty']!)),
                      Center(child: Text(item['Unit Price']!)),
                      Center(child: Text(item['Price']!)),
                    ],
                  ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Grand Total: \$${_calculateTotal(cartItems)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _calculateTotal(List<Map<String, dynamic>> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += double.parse(item['Price']!);
    }
    return total.toStringAsFixed(2);
  }
}
