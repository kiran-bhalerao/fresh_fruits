import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fresh_fruits/models/fruit.dart';

class DetailsPage extends StatelessWidget {
  static String routeName = '/DetailsPage';

  @override
  Widget build(BuildContext context) {
    final Fruit fruit = ModalRoute.of(context).settings.arguments as Fruit;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          color: fruit.themeColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: height * 0.04),
                    width: double.infinity,
                    child: Hero(
                      tag: '${fruit.name}-image',
                      child: Image.asset(
                        fruit.img,
                        scale: min((1700 / height), 5),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(120),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 22, 16, 2),
                          child: Text(
                            fruit.name,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Text(
                            '${fruit.quantity}${fruit.unit}',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                height: 2,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            Text(
                              '\$${fruit.price}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: fruit.themeColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: fruit.themeColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
