import 'package:flutter/material.dart';
import 'package:uts_2022130019/model/cart_product.dart';
import 'package:uts_2022130019/model/user_data.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProduct = [];
  List<CartProduct> get cartProducts => _cartProduct;
  
  int _value;
  int _checkoutTotalPrice;
  final UserData _userData = UserData();
  CartProvider(
    this._value, 
    this._checkoutTotalPrice
  );

  int get value => _value;
  int get checkoutTotalPrice => _checkoutTotalPrice;
  String get userEmail => _userData.email;
  String get userPassword => _userData.password;

  set value(int value) {
    _value = value;
    notifyListeners();
  }

  set checkoutTotalPrice(int checkoutTotalPrice) {
    _checkoutTotalPrice = checkoutTotalPrice;
    notifyListeners();
  }

  void addProductCart(CartProduct cartProduct) {
    _cartProduct.add(cartProduct);
    notifyListeners();
  }

  void editPassword(String password) {
    _userData.password = password;
    notifyListeners();
  }
}