import 'package:bloc/bloc.dart';
import '../models/product.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(Product product) {
    final cartItems = List<Map<String, dynamic>>.from(state);

    final index = cartItems.indexWhere((item) => item['name'] == product.name);

    if (index >= 0) {
      cartItems[index]['Qty'] =
          (int.parse(cartItems[index]['Qty']) + 1).toString();
      cartItems[index]['Price'] =
          (int.parse(cartItems[index]['Qty']) * product.price).toString();
    } else {
      cartItems.add({
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
}
