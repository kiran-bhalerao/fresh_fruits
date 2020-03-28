import 'package:flutter/material.dart';
import 'package:fresh_fruits/pages/details.dart';
import 'package:fresh_fruits/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
        primaryColor: Color(0xFF42ce6c),
      ),
      home: HomePage(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        DetailsPage.routeName: (ctx) => DetailsPage()
      },
    );
  }
}
