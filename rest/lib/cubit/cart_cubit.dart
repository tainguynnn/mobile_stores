import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rest/widgets/dialog_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../constant/constant.dart';
import '../models/product.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(Product product) {
    final cartItems = List<Map<String, dynamic>>.from(state);

    final index = cartItems.indexWhere((item) => item['id'] == product.id);

    if (index >= 0) {
      cartItems[index]['Qty'] =
          (int.parse(cartItems[index]['Qty']) + 1).toString();
      cartItems[index]['Price'] =
          (int.parse(cartItems[index]['Qty']) * product.price).toString();
    } else {
      cartItems.add({
        'unit': product.quantity,
        'id': product.id,
        'name': product.name,
        'Qty': '1',
        'Unit Price': product.price.toString(),
        'Price': product.price.toString(),
      });
    }

    emit(cartItems);
  }

  void deleteFromCart(Map<String, dynamic> cartItem) {
    final cartItems = List<Map<String, dynamic>>.from(state);

    final index =
        cartItems.indexWhere((item) => item['name'] == cartItem['name']);

    if (int.parse(cartItems[index]['Qty']) > 1) {
      cartItems[index]['Qty'] =
          (int.parse(cartItems[index]['Qty']) - 1).toString();
      cartItems[index]['Price'] = (int.parse(cartItems[index]['Price']) -
              int.parse(cartItems[index]['Unit Price']))
          .toString();
    } else {
      cartItems.removeWhere((item) => item['name'] == cartItem['name']);
    }

    emit(cartItems);
  }

  void clearCart() {
    emit([]);
  }

  Future<void> createOrder(BuildContext context) async {
    final cartItems = state;
    if (cartItems.isEmpty) {
      DialogHelper.showErrorDialog(context, 'no product in cart');
      return;
    } else {
      final total = cartItems.fold<int>(
          0,
          (previousValue, item) =>
              previousValue + int.parse(item['Price'] ?? '0'));

      final orderDetails = cartItems
          .map((item) => {
                'productId': item['id'],
                'quantity': int.parse(item['Qty']),
                'unitPrice': int.parse(item['Unit Price'])
              })
          .toList();

      final orderBody = jsonEncode({
        'total': total,
        'paymentMethod': 2,
        'orderStatus': 1,
        'details': orderDetails,
      });

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');

      final response = await http.post(
        Uri.parse('$baseUrl/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Replace with actual token
        },
        body: orderBody,
      );

      if (response.statusCode == 201) {
        clearCart();
      } else {
        DialogHelper.showErrorDialog(context, 'not enough unit in stock');
      }
    }
  }
}
