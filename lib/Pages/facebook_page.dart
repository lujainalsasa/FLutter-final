import 'package:flutter/material.dart';
class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                'Facebook Registration\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPage',
                textScaleFactor: 2,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FacebookForm(),
          ],
        ),
      );
  }
}


class FacebookForm extends StatefulWidget {
  @override
  FacebookFormState createState() {
    return FacebookFormState();
  }
}

class FacebookFormState extends State<FacebookForm> {
  final _formKey = GlobalKey<FormState>();
  String email_num = '';
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
                  color: Colors.blue,
                ),
                hintText: 'username@mail.com / +9627426474',
                labelText: 'Email/PhoneNumber',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid Email/Number';
                }
                email_num = value;
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
                    color: Colors.blue,
                  ),
                  hintText: '.............',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
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
            height: 15,
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 180),
              child: ElevatedButton(
                child: const Text(
                  'SignUp',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              )),
        ],
      ),
    );
  }
}
