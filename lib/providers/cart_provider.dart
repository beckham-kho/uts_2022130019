import 'package:flutter/material.dart';
import 'package:uts_2022130019/model/cart_product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProduct = [];
  List<CartProduct> get cartProducts => _cartProduct;
  
  int _value = 1;
  CartProvider(this._value);
  int get value => _value;

  set value(int value) {
    _value = value;
    notifyListeners();
  }

  void addProductCart(CartProduct cartProduct) {
    _cartProduct.add(cartProduct);
    notifyListeners();
  }
}