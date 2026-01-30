import 'package:flutter/material.dart';

//contador dor com  Provider
class ContadorProviderService extends ChangeNotifier {
  int _contador = 0;

  int get contador => _contador;

  void incrementar() {
    _contador = _contador + 1;
    notifyListeners();
  }
}
