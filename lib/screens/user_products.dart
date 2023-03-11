import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/app_drawer.dart';

import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const String routeName = "/userProducts";

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products!'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, index) => Column(
            children: [
              UserProductItem(productsData.items[index].title,
                  productsData.items[index].imageUrl),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
