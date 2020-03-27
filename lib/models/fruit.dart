import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final double quantity;
  final String unit;
  final double price;
  final Color themeColor;
  final String img;

  Fruit({
    @required this.name,
    @required this.img,
    @required this.quantity,
    @required this.unit,
    @required this.price,
    this.themeColor,
  });
}

final List<Fruit> fruitList = [
  Fruit(
    name: 'Apple',
    img: 'assets/apple.png',
    quantity: 220,
    unit: 'kg',
    price: 28,
    themeColor: Color(0xFFFF949A),
  ),
  Fruit(
    name: 'Banana',
    img: 'assets/banana.png',
    quantity: 120,
    unit: 'kg',
    price: 38,
    themeColor: Color(0xFFFFED9F),
  ),
  Fruit(
    name: 'Mango',
    img: 'assets/mango.png',
    quantity: 180,
    unit: 'kg',
    price: 32,
    themeColor: Color(0xFFFFD58B),
  ),
  Fruit(
    name: 'Berries',
    img: 'assets/berries.png',
    quantity: 80,
    unit: 'kg',
    price: 12,
    themeColor: Color(0xFFFFA4AD),
  ),
];
