import 'package:flutter/material.dart';
import 'package:vastrafy/widget/products_grid.dart';

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
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
