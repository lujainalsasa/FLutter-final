import 'package:flutter/material.dart';
import 'package:midd/models/coffee.dart';

// ignore: must_be_immutable
class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('${coffee.price}'),
        leading: Image.asset(coffee.imgPath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
