import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midd/Pages/login_form_page.dart';
import 'package:midd/pages/home_page.dart';
import 'package:midd/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Register Page',
            textScaleFactor: 1,
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: ElevatedButton(
            child: Icon(Icons.arrow_back, color: Colors.brown),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Login();
              }));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.white, alignment: Alignment.centerLeft),
          )),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          RegisterForm(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  int phoneN = 0;
  String dateD = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.brown,
                  ),
                  hintText: 'username@mail.com',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.brown,
                  ),
                ),
                controller: emailController),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color: Colors.brown,
                ),
                hintText: '+96277362627',
                labelText: 'PhoneNumber',
                labelStyle: TextStyle(
                  color: Colors.brown,
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid phone number';
                } else {
                  if (!(double.tryParse(value) != null)) {
                    return "Enter a valid number";
                  }
                }
                phoneN = int.parse(value);
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.date_range,
                  color: Colors.brown,
                ),
                hintText: 'd/m/y',
                labelText: 'BirthDate',
                labelStyle: TextStyle(
                  color: Colors.brown,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid Date';
                }
                dateD = value;
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.brown,
                    ),
                    hintText: '.............',
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    errorStyle: TextStyle(color: Colors.red)),
                controller: passwordController),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.brown),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _handleSignUp();
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, alignment: Alignment.centerLeft),
              )),
        ],
      ),
    );
  }

  Future<void> _handleSignUp() async {
    try {
      await Auth()
          .createWithEmailAnsPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(
        () {
          print('User Added Success');
        },
      );
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
