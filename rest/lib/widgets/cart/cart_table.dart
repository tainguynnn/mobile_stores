import 'package:flutter/material.dart';

class CartTable extends StatefulWidget {
  const CartTable({super.key});

  @override
  State<CartTable> createState() => _CartTableState();
}

class _CartTableState extends State<CartTable> {
  var list = [
    {'name': "Iphone 15", "Qty": '1', 'Unit Price': '1099', 'Price': '1099'},
    {'name': "Iphone X", "Qty": '1', 'Unit Price': '99', 'Price': '1099'},
    {'name': "Iphone X", "Qty": '1', 'Unit Price': '1099', 'Price': '1099'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(color: Colors.transparent),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FixedColumnWidth(60), // thay đổi theo tỉ lệ màn hình
            2: FixedColumnWidth(90),
            3: FixedColumnWidth(60),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            const TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    // Bottom border color
                    width: 1.0, // Border width
                  ),
                ),
                color: Color.fromRGBO(249, 249, 249,
                    1), // Setting the background color for the first row
              ),
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Product',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
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
            for (var item in list)
              TableRow(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromRGBO(
                          221, 221, 221, 1), // Bottom border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.close,
                            color: Colors.red,
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
              )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 1), // Shadow position
              ),
            ],
            color: Colors.white, // Background color for the row
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              // Aligns the text to the left side
              child: Text(
                'Grand Total: \$2807',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
