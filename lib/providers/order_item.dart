import 'package:flutter/foundation.dart';
import 'package:flutter_shop/providers/cart_item.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({required this.id, required this.amount, required this.products, required this.dateTime});
}
