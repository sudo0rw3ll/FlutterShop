import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../providers/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    double sum = 0.0;
    _items.forEach((key, val) => {sum += val.price * val.quantity});
    return sum;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      // change qtty
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }

    notifyListeners();
  }
}
