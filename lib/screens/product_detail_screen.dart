import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productDetail';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(product.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
