import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fresh_fruits/models/fruit.dart';

class FruitCard extends StatelessWidget {
  final int index;
  final Fruit fruit;

  const FruitCard({Key key, this.index, this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Transform(
            transform: Matrix4.translationValues(
                index == 0 ? -30 : -30 + (index * 20.0), 0, 0),
            child: Container(
              width: width * 0.68,
              decoration: BoxDecoration(
                color: fruit.themeColor != null
                    ? fruit.themeColor
                    : Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Hero(
                        tag: '${fruit.name}-image',
                        child: Image.asset(
                          fruit.img,
                          scale: min((2500 / height), 5),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Text(
                            fruit.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 6),
                          width: double.infinity,
                          child: Text(
                            '${fruit.quantity}${fruit.unit}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${fruit.price}',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
