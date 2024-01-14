import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midd/Pages/home_page.dart';
import 'package:midd/Pages/profile_page.dart';
import 'package:midd/Pages/register_page.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createWithEmailAnsPassword(
      {required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
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
                      color: Color.fromARGB(255, 104, 103, 102),
                    ),
                  ),
                  controller: emailController),
            ),
            const SizedBox(
              height: 25,
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
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    var snak = const SnackBar(
                      content: Text(
                        'Check your email',
                      ),
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(seconds: 5),
                      showCloseIcon: true,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snak);
                  },
                  child: const Text("Forget password?  ",
                      textScaleFactor: 0.75,
                      style: TextStyle(color: Colors.brown)),
                ),
              ], //children
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handleSignin();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, alignment: Alignment.centerLeft),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.brown),
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                ),
                TextButton(
                  // style: TextButton.styleFrom(
                  //   textStyle: const TextStyle(fontSize: 20),
                  // ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Register();
                    }));
                  },
                  child: const Text('Register Now!',
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignin() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print('login sucessfully');
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomePage();
      }));
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
