import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:midd/Pages/home_page.dart';
import 'package:midd/Pages/login_form_page.dart';
import 'package:midd/models/user_details.dart';
import 'package:midd/pages/login_page.dart';
import 'package:file_picker/file_picker.dart';

final TextEditingController numberController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController fullNameController = TextEditingController();

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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          img == null
              ? Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.photo,
                      color: Colors.brown,
                    ),
                    onPressed: () {
                      pickImage();
                    },
                  ))
              : Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: IconButton(
                    icon: CircleAvatar(
                      backgroundImage: MemoryImage(img!.files.first.bytes!),
                    ),
                    onPressed: () {
                      pickImage();
                    },
                  )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.brown,
                  ),
                  hintText: 'User Name',
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color: Colors.brown,
                  ),
                ),
                controller: fullNameController),
          ),
          const SizedBox(
            height: 15,
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
                    color: Colors.brown,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.com')) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
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
              controller: numberController,
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
                hintText: 'Amman,Jordan',
                labelText: 'Address',
                labelStyle: TextStyle(
                  color: Colors.brown,
                ),
              ),
              controller: addressController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid password';
                  } else {
                    if (value.length < 8) {
                      return "Enter a valid password > 8";
                    }
                  }
                  return null;
                },
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

  final DatabaseReference userbref =
      FirebaseDatabase.instance.ref().child('Users');
  final Reference profileimage = FirebaseStorage.instance
      .ref()
      .child("UserProfilePage/${DateTime.now().microsecondsSinceEpoch}.jpg");

  Future<void> _handleSignUp() async {
    UploadTask uploadtask = profileimage.putData(img!.files.first.bytes!);
    String imgurl = await (await uploadtask).ref.getDownloadURL();

    await Auth()
        .createWithEmailAnsPassword(
            email: emailController.text, password: passwordController.text)
        .whenComplete(() {
      print('user added successfully');

      Auth().auth.authStateChanges().first;
      Future.delayed(Duration(seconds: 5)).then((value) {
        try {
          UserDetails user = UserDetails(
              name: fullNameController.text,
              email: emailController.text,
              phoneN: numberController.text,
              address: addressController.text,
              profilePhoto: imgurl);
          if (Auth().auth.currentUser != null) {
            userbref
                .child(Auth().auth.currentUser!.uid)
                .set(user.toMap())
                .then((value) {
              print('user added sucessfully to real time database');
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return HomePage();
              }));
            });
          } else {
            print('the user uid is stell null');
          }
        } on FirebaseAuthException catch (error) {
          print('error acuured...........');
          print(error.message);
        }
      });
    });
  }

  FilePickerResult? img;
  Future<void> pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) {
      return null;
    } else {
      setState(() {
        img = result;
      });
    }
  }
}
