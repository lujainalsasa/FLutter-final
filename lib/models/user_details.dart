import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:midd/Pages/login_form_page.dart';
import 'package:midd/models/coffee.dart';

class UserDetails {
  String name;
  String email;
  String phoneN;
  String address;
  String profilePhoto;

  UserDetails({
    required this.name,
    required this.email,
    required this.phoneN,
    required this.address,
    required this.profilePhoto,
  });

  // Convert UserDetails to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneN': phoneN,
      'address': address,
      'profilePhoto': profilePhoto,
    };
  }

  // Create UserDetails from Map
  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      name: map['name'],
      email: map['email'],
      phoneN: map['phoneN'],
      address: map['address'],
      profilePhoto: map['profilePhoto'],
    );
  }
}

class FirebaseService {
  User? user = Auth().auth.currentUser;
  DatabaseReference userref = FirebaseDatabase.instance.ref().child('Users');
  Future<UserDetails?> getUserFormDatabase() async {
    print("user details");
    try {
      if (user != null) {
        print("user details true");
        DatabaseEvent event = await userref.child(user!.uid).once();
        if (event.snapshot.value != null) {
          print("user details true $event");
          Map<dynamic, dynamic> snapMap = event.snapshot.value as dynamic;
          print(snapMap);
          return UserDetails.fromMap(snapMap as dynamic);
        } else {
          print('user details null');
          return null;
        }
      } else {
        print('the current user is null');
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
   Future<List<Coffee>> getProductDetails() async {
    DatabaseReference productsRef =
        FirebaseDatabase.instance.ref().child("Products");

    try {
      DatabaseEvent event = await productsRef.once();

      if (event.snapshot.value != null) {
        print(event.snapshot.value.toString());

        List<Coffee> productList = [];
        Map<dynamic, dynamic> snapshotData = event.snapshot.value as dynamic;

        snapshotData.forEach((key, value) {
          productList.add(Coffee.fromMap(value as Map<dynamic, dynamic>));
        });

        print("Product List: $productList");
        return productList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error getting product details: $e');
      return [];
    }
  }

}
