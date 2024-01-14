import 'package:flutter/material.dart';
import 'package:midd/Pages/item_details_page.dart';
import 'package:midd/models/coffee.dart';
import 'package:midd/models/coffee_shop.dart';
import 'package:midd/models/user_details.dart';
import '../components/cofee_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Coffee>? products;
  @override
  initState() {
    super.initState();
    fatchProductDetails();
  }

  Future<void> fatchProductDetails() async {
    try {
      List<Coffee>? ps = await FirebaseService().getProductDetails();

      if (ps != null) {
        setState(() {
          products = ps;
        });
      } else {
        print("Product Data not Found not found");
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
          products == null
              ? Center(
                  child: Column(
                  children: [
                    Text("Still loading the product details"),
                    CircularProgressIndicator()
                  ],
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      // indvisual cart item
                      return CoffeeTile(
                        coffee: Coffee(
                            name: products![index].name,
                            price: products![index].price,
                            imgPath: products![index].imgPath),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ItemDetail();
                          }));
                          item = Coffee(name: products![index].name, price: products![index].price, imgPath: products![index].imgPath);                        },
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
