import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/products_provider.dart';

import '../providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show all'), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
                child: ch!,
                value: cartData.itemCount.toString(),
                color: Colors.greenAccent),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
