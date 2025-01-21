import 'package:flutter/foundation.dart';

class cartItem {
  final String id;
  final String title;
  final int qty;
  final double price;

  cartItem(
      {required this.id,
      required this.price,
      required this.qty,
      required this.title});
}

class Cart with ChangeNotifier {
  Map<String, cartItem> _items = {};
  Map<String, cartItem> get items {
    return {..._items};
  }

  void addItem(
    String id,
    String title,
    double price,
  ) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingcartItem) => cartItem(
              id: existingcartItem.id,
              price: existingcartItem.price,
              qty: existingcartItem.qty + 1,
              title: existingcartItem.title));
    } else {
      _items.putIfAbsent(
          id,
          () => cartItem(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              qty: 1));
    }
  }
}
