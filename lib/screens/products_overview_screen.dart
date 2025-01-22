import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/cart.dart';
import 'package:vastrafy/screens/cart_screen.dart';
import 'package:vastrafy/widget/products_grid.dart';
// import 'package:vastrafy/widget/badge.dart';

enum filterOptions {
  favourites,
  all,
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
        title: Text('VastraFY'),
        actions: [
          PopupMenuButton(
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.favourites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favourites'),
                value: filterOptions.favourites,
              ),
              PopupMenuItem(
                child: Text('All Clothes'),
                value: filterOptions.all,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              label: Text(cart.itemCount.toString()),
              child: ch ?? const Icon(Icons.shopping_cart_sharp),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_sharp,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
