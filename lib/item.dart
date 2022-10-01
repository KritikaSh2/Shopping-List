import 'package:flutter/material.dart';

class Item {
  final String name;
  final double price;
  bool check;
  String time;
  Item(
      {required this.name,
      required this.price,
      this.check = false,
      required this.time});

  void togglecheck() {
    check = !check;
  }
}
