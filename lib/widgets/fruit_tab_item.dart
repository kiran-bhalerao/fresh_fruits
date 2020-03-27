import 'package:flutter/material.dart';
import 'package:fresh_fruits/models/fruit.dart';

class FruitTabItem extends StatelessWidget {
  final Fruit fruit;

  const FruitTabItem({Key key, @required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: fruit.themeColor != null
                  ? fruit.themeColor
                  : Theme.of(context).primaryColor.withOpacity(0.8),
            ),
            child: Image.asset(
              fruit.img,
              scale: 10,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fruit.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${fruit.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.black),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
