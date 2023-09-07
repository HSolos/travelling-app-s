import 'package:flutter/material.dart';

class PriceProvider extends ChangeNotifier {
  //
  String _price = "";
  String get getPrice => _price;
  //
  void setPrice(price) {
    _price = price;
    notifyListeners();
  }
}
