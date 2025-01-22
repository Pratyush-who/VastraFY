import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int qty;
  final double price;

  CartItem({
    required this.id,
    required this.price,
    required this.qty,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get total {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.qty;  // Fixed reference to the item properties
    });
    return total;
  }

  void addItem(
    String id,
    String title,
    double price,
  ) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              price: existingCartItem.price,
              qty: existingCartItem.qty + 1,
              title: existingCartItem.title));
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(), price: price, title: title, qty: 1),
      );
    }
    notifyListeners();
  }
}
