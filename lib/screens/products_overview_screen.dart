import 'package:flutter/material.dart';
import 'package:vastrafy/widget/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VastraFY'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductsGrid(),
    );
  }
}

