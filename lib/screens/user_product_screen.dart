import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/products.dart';
import 'package:vastrafy/widget/app_drawer.dart';
import 'package:vastrafy/widget/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        backgroundColor: Colors.purpleAccent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductItem(
              prodData.items[i].title, Divider(), prodData.items[i].imageUrl),
          itemCount: prodData.items.length,
        ),
      ),
    );
  }
}
