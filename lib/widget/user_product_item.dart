import 'package:flutter/material.dart';
import 'package:vastrafy/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String id;
  UserProductItem(this.title,this.imgUrl,this.id );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments:id );},
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_forever),
              color: Colors.redAccent[500],
            ),
          ],
        ),
      ),
    );
  }
}
