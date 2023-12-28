import 'package:flutter/material.dart';
import 'package:midd/Pages/item_details_page.dart';
import 'package:midd/models/coffee.dart';
import 'package:midd/models/coffee_shop.dart';
import '../components/cofee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          // heading
          const Text('How would you like your coffee ?',
              style: TextStyle(fontSize: 20, color: Colors.brown)),
          const SizedBox(
            height: 25,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: shop.length,
              itemBuilder: (context, index) {
                // indvisual cart item
                return CoffeeTile(
                  coffee: Coffee(
                      name: shop[index].name,
                      price: shop[index].price,
                      imgPath: shop[index].imgPath),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ItemDetail();
                    }));
                    item = shop[index];
                  },
                  icon: const Icon(Icons.add),
                );
              },
            ),
          ),
          
        ]),
      ),
    );
  }
}
