import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/products.dart';
import 'package:vastrafy/screens/edit_product_screen.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: ListView.builder(
          itemCount: prodData.items.length,
          itemBuilder: (_, i) => Column(children: [UserProductItem(
              prodData.items[i].title, prodData.items[i].imageUrl,prodData.items[i].id),Divider(),],)
        ),
      ),
    );
  }
}
