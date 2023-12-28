import 'package:flutter/material.dart';
import 'package:midd/Pages/login_page.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 50,
            width: 10,
          ),
          const Image(
            image: AssetImage(
              "lib/images/coffeeBooth.png",
            ),
            height: 300,
            width: 300,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          const Text(
            "Embark on a journey of flavor at our coffee haven. Let's start and indulge in the perfect blend where art meets excellence☕",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Login();
              }));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: const Text(
              "Let's start",
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
