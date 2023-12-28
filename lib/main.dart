import 'package:flutter/material.dart';
import 'package:midd/Pages/logo.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'CoffeeApp', home: Logo());
  }
}
