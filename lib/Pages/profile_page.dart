import 'package:flutter/material.dart';
import 'package:midd/Pages/home_page.dart';
import 'package:midd/Pages/login_form_page.dart';
import 'package:midd/Pages/register_page.dart';
import 'package:midd/models/coffee.dart';
import 'package:midd/models/user_details.dart';

class userInfo extends StatefulWidget {
  const userInfo({super.key});

  @override
  State<userInfo> createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  final FirebaseService fbs = FirebaseService();
  UserDetails? usr;

  late String imgurl = "";
  @override
  void initState() {
    super.initState();
    print('user not equal to null');
    fatchUserData();
  }

  Future<void> fatchUserData() async {
    try {
      UserDetails? us = await fbs.getUserFormDatabase();
      if (us != null) {
        setState(() {
          usr = us;
          imgurl = usr!.profilePhoto;
        });
      } else {
        print('user not found');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (usr != null) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown.shade300,
            title: Text("User Information"),
          ),
          drawer: LeftDrawerWidget(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(usr!.profilePhoto),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.brown),
                      Text('Full Name : ',
                          style: TextStyle(color: Colors.brown)),
                      Text(usr!.name, style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                ),
                Card(
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.brown),
                      Text(' Email : ', style: TextStyle(color: Colors.brown)),
                      Text(usr!.email, style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                ),
                Card(
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.brown),
                      Text(' Phone Number : ',
                          style: TextStyle(color: Colors.brown)),
                      Text(usr!.phoneN, style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                ),
                Card(
                  child: Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.brown),
                      Text(' Address: ', style: TextStyle(color: Colors.brown)),
                      Text(usr!.address, style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Auth().auth.signOut();
                      Navigator.pushNamed(context, "/");
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, alignment: Alignment.centerLeft),
                    child: Text(
                      'SignOut',
                      style: TextStyle(color: Colors.brown),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, alignment: Alignment.centerLeft),
                    onPressed: () {
                      //  addtodb();
                    },
                    child: Text(
                      "Add Data To FB",
                      style: TextStyle(color: Colors.brown),
                    )),
              ],
            ),
          ));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class notifications extends StatelessWidget {
  const notifications({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("notifications"),
      ),
      drawer: LeftDrawerWidget(),
      body: Center(
        child: Icon(
          Icons.notifications,
          size: 200,
          color: Colors.brown,
        ),
      ),
    );
  }
}

class Gethelp extends StatelessWidget {
  const Gethelp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("Get help"),
      ),
      drawer: LeftDrawerWidget(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "How can I help you?",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your problem",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown.shade300,
                ),
                onPressed: () {
                  var snak = const SnackBar(
                    content: Text(
                      'Problem Sent ',
                    ),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(seconds: 5),
                    showCloseIcon: true,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snak);
                },
                child: Text(
                  "send",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reminders extends StatelessWidget {
  const Reminders({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("voucher"),
      ),
      drawer: LeftDrawerWidget(),
      body: Center(
          child: Image(
        image: AssetImage('lib/images/vocher.gif'),
        height: 300,
        width: 300,
      )),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("Notifications"),
      ),
      drawer: LeftDrawerWidget(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person, color: Colors.brown),
                        labelText: "New name",
                        errorStyle: TextStyle(color: Colors.red)),
                    controller: fullNameController,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.password, color: Colors.brown),
                      labelText: "New password",
                      errorStyle: TextStyle(color: Colors.red)),
                  controller: passwordController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.numbers, color: Colors.brown),
                      labelText: "New number",
                      errorStyle: TextStyle(color: Colors.red)),
                  controller: numberController,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email, color: Colors.brown),
                        labelText: "New email",
                        errorStyle: TextStyle(color: Colors.red)),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.com')) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  )),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 400, top: 10),
                child: ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Information has been updated"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftDrawerWidget extends StatefulWidget {
  const LeftDrawerWidget({super.key});
  @override
  State<LeftDrawerWidget> createState() => _LeftDrawerWidgetState();
}

class _LeftDrawerWidgetState extends State<LeftDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${fullNameController.text}'),
            accountEmail: Text('${emailController.text}'),
            currentAccountPicture: Icon(
              Icons.girl_sharp,
              size: 80,
              color: Colors.white,
            ),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Color.fromARGB(255, 249, 245, 245),
              )
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "data:image/jpeg;base64,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"),
                    fit: BoxFit.fitWidth)),
          ),
          MenuListTile()
        ],
      ),
    );
  }
}

class MenuListTile extends StatefulWidget {
  const MenuListTile({super.key});
  @override
  State<MenuListTile> createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          iconColor: Colors.brown,
          title: Text("User Info"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return userInfo();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          iconColor: Colors.brown,
          title: Text("Notifications"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return notifications();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.help_rounded),
          iconColor: Colors.brown,
          title: Text("Get help"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Gethelp();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.card_giftcard),
          iconColor: Colors.brown,
          title: Text("Voucher"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Reminders();
            }));
          },
        ),
        Divider(
          color: const Color.fromARGB(255, 53, 31, 23),
        ),
        ListTile(
          leading: Icon(Icons.home),
          iconColor: Colors.brown,
          title: Text("Home"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return HomePage();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          iconColor: Colors.brown,
          title: Text("Settings"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Settings();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          iconColor: Colors.brown,
          title: Text("LogOut"),
          onTap: () {
            Auth().auth.signOut();
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}
