import 'package:midd/Pages/profile_page.dart';
import 'package:midd/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'shop_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  void navigatebottombar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [
    // shopPage
    ShopPage(),
    // cartPage()
    Cart(),
    // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text('Shopping'),
      ),
      drawer: LeftDrawerWidget(),
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigatebottombar(index)),
      body: _pages[_selectedindex],
    );
  }
}
