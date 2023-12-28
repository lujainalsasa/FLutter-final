import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.brown,
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.brown[700],
          tabBackgroundColor: Colors.brown.shade300,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: const [
            GButton(icon: Icons.home, text: 'shop'),
            GButton(icon: Icons.shopping_bag, text: 'cart'),
          ]),
    );
  }
}
