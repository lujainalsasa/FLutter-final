import 'package:midd/models/coffee.dart';



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
