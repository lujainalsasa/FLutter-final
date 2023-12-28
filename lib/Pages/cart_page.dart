import 'package:flutter/material.dart';
import 'package:midd/models/coffee.dart';
import 'package:midd/models/coffee_shop.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFromCart(Coffee coffee, count, index) {
    userCart.removeAt(index);
    setState(() {
      total_price -= (coffee.price * count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.brown.shade300,
                      alignment: Alignment.center,
                      child: const Row(
                        children: [Icon(Icons.delete), Text('delete')],
                      ),
                    ),
                    key: ValueKey<String>(userCart[index].name),
                    child: ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'you clicked on ${userCart[index].name}' +
                                    '  swipe left to delete')));
                        removeFromCart(
                            userCart[index], userCount[index], index);
                      },
                      leading: CircleAvatar(
                        child:
                            Image(image: AssetImage(userCart[index].imgPath)),
                      ),
                      title: Text('${userCart[index].name} '),
                      subtitle: Text('Price : ${userCart[index].price}  JD'),
                      trailing: Text('${userCount[index]}'),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        userCart.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price :',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Text(
                      '$total_price',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text(
                    'Pay now ',
                    style: TextStyle(color: Colors.brown),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, alignment: Alignment.centerLeft),
                  onPressed: () {
                    var snak = const SnackBar(
                      content: Text(
                        'Thank you ',
                      ),
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(seconds: 5),
                      showCloseIcon: true,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snak);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
