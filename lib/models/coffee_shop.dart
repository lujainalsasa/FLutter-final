import 'package:midd/models/coffee.dart';

final List<Coffee> shop = [
  //Coffee(name: 'cup', price: '2.5 JD', imgPath: 'lib/images/cofeecup.gif'),
  Coffee(name: 'Black', price: 3.5, imgPath: 'lib/images/black.gif'),
  Coffee(name: 'Tea', price: 2, imgPath: 'lib/images/tea.gif'),
  Coffee(name: 'Cappuccino', price: 4, imgPath: 'lib/images/cappuccino.gif'),
  Coffee(name: 'Lattee', price: 2.5, imgPath: 'lib/images/cup.gif'),
];

// user cart
List<Coffee> userCart = [];
// user product count
List<int> userCount = [];
double total_price = 0;

// add item to cart
void addToCart(Coffee coffee) {
  userCart.add(coffee);
}

// remove item from cart
void removeFromCart(index) {
  userCart.removeAt(index);
}

//
Coffee item = Coffee(name: 'name', price: 1.0, imgPath: 'imgPath');
