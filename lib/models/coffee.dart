import 'package:firebase_database/firebase_database.dart';

class Coffee {
  final String name;
  final double price;
  final String imgPath;
  Coffee({required this.name, required this.price, required this.imgPath});

  Map<dynamic, dynamic> toMap() {
    return {'name': name, 'price': price, 'imagePath': imgPath};
  }

  factory Coffee.fromMap(Map<dynamic, dynamic> map) {
    return Coffee(
        name: map['name'], price: map['price'], imgPath: map['imagePath']);
  }
}

List<String> images = [
  "lib/images/black.gif",
  'lib/images/tea.gif',
  'lib/images/cappuccino.gif',
  "lib/images/cup.gif"
];
List<String> names = [ 'Black', 'Tea', 'Cappuccino', 'Lattee'];

List<double> price = [3.5, 2, 4, 2.5];

//  void addtodb() {
//     final DatabaseReference dataref =
//         FirebaseDatabase.instance.ref().child("Products");
//     for (int i = 0; i < names.length; i++) {
//       Coffee phone = Coffee(
//           name: names[i],price: price[i],imgPath: images[i]);
//       dataref.push().set(phone.toMap()).then((value) {
//         print("Products Details Added Sucessfully");
//       });
//     }
//   }
