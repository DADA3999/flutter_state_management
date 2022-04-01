import 'package:flutter/material.dart';

class CounterStore with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    // 変更を検知
    notifyListeners();
  }
}