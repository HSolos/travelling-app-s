import 'package:flutter/material.dart';

class TIcketDataProvider extends ChangeNotifier {
  //
  String _price = "";
  String _asientos = "Un asiento";
  String? _destino = "";
  String? _fecha = "";

  List<String> _hours = ["8:30 - 10:45"];
  String? _hInicio = "";
  String? _hFinal = "";
//["8:30 - 10:45", "10:30 - 13:45", "13:30 - 16:45"]

  String get getPrice => _price;
  String get getAsientos => _asientos;
  String get getDestino => _destino ?? "";
  String get getHInicio => _hInicio ?? "";
  String get getHFinal => _hFinal ?? "";
  String get getFecha => _fecha ?? "";
  List<String> get getHours => _hours;

  set setHours(hours) => _hours = hours;
  //
  //
  void setAsientos(asientos) {
    _asientos = asientos;
    notifyListeners();
  }

  void setPrice(price) {
    _price = price;
    notifyListeners();
  }

  void setDestino(destino) {
    _destino = destino;
    notifyListeners();
  }

  void setHInicio(ini) {
    _hInicio = ini;
    notifyListeners();
  }

  void setHFinal(fin) {
    _hFinal = fin;
    notifyListeners();
  }

  void setFecha(f) {
    _fecha = f;
    notifyListeners();
  }
}
