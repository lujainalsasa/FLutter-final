import 'package:flutter/material.dart';
import 'package:midd/models/coffee.dart';
import 'package:midd/models/coffee_shop.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int itemCount = 1;
  void addToCart(Coffee coffee, int count) {
    userCart.add(coffee);
    userCount.add(count);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Item addeed sucessfully'),
            ));
    total_price += (coffee.price * count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Description',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image(image: AssetImage(item.imgPath), height: 100, width: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (itemCount > 1) {
                            itemCount--;
                          }
                        });
                      },
                    ),
                    Text(
                      '$itemCount',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          itemCount++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.brown.shade300)),
              onPressed: () {
                // Add to cart logic goes here
                addToCart(item, itemCount);
                print('Added to cart: $itemCount items');
                itemCount = 0;
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
