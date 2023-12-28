import 'package:flutter/material.dart';
import 'package:midd/Pages/login_form_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Welcome Back!",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
