import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fresh_fruits/models/fruit.dart';
import 'package:fresh_fruits/widgets/fruit_card.dart';
import 'package:fresh_fruits/widgets/fruit_tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var currentPage = 0;
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
      initialPage: currentPage,
      keepPage: true,
    );
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fresh Fruits',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'We have more than 1000 fruits',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 4,
                          blurRadius: 6,
                          offset: Offset(0, 1),
                          color: Colors.green.withOpacity(0.3))
                    ]),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 21),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search for Fruit',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                fontSize: 18,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
          ),
        ),
        Container(
          height: max(height * 0.51, 300),
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: PageView.builder(
            itemBuilder: (ctx, index) => FruitCard(
              fruit: fruitList[index],
              index: index,
            ),
            controller: _pageController,
            itemCount: fruitList.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            tabs: <Widget>[
              Tab(child: Text('HOT')),
              Tab(child: Text('NEW')),
              Tab(child: Text('ALL')),
            ],
          ),
        ),
        Container(
          height: height * 0.3,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: fruitList.reversed
                        .map((f) => FruitTabItem(fruit: f))
                        .toList(),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: fruitList.reversed
                        .map((f) => FruitTabItem(fruit: f))
                        .toList(),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: fruitList.reversed
                        .map((f) => FruitTabItem(fruit: f))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
