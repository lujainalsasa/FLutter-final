import 'package:flutter/material.dart';
import 'package:midd/Pages/home_page.dart';
import 'package:midd/Pages/register_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = "";
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
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')  ||  ! value.contains('.com')) {
                    return 'Please enter valid email';
                  }
                  email = value;
                  return null;
                },
              ),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid password';
                  } else {
                    if (value.length < 8) {
                      return "Enter a valid password > 8";
                    }
                  }
                  pass = value;
                  return null;
                },
              ),
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
                  child: const Text("Forget password?      ",
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return HomePage();
                      }));
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
}
