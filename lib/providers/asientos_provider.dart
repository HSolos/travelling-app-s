import 'package:flutter/material.dart';

class AsientosProvider extends ChangeNotifier {
  //
  String _asientos = "Un asiento";
  String get getAsientos => _asientos;
  void setAsientos(asientos) {
    _asientos = asientos;
    notifyListeners();
  }
}
