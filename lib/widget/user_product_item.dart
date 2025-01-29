import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  UserProductItem(this.title, this.imgUrl);

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
            IconButton(onPressed: () {}, icon: Icon(Icons.edit),),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever),color: Colors.redAccent[500],),
          ],
        ),
      ),
    );
  }
}
