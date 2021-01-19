import 'package:Selling_Platform/models/local_user.dart';
import 'package:Selling_Platform/utils/services/firebase_auth_service.dart';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalUser user = LocalUser.defaultUser();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<FirebaseAuthService>(context);
    var height = MediaQuery.of(context).size.height;
    List<Widget> drawerItems = [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: backgroundColor1),
        currentAccountPicture: CircleAvatar(
          radius: 50.0,
          // backgroundImage: Image(user.profilePicURL),
        ),
        accountEmail: Text(user.email),
        accountName: Text(user.name),
        onDetailsPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/profile');
        },
      ),
      ListTile(
        leading: Icon(Icons.warning),
        title: Text('About'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout'),
        onTap: () async{ 
          await userProvider.signOut();
          Navigator.pushReplacementNamed(context, "/root");
          },
      ),
    ];


    return Scaffold(
        backgroundColor: backgroundColor1,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor1,
        ),
        endDrawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: drawerItems),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: height/4),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Choose type of operation you want",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: height / 10),
                Center(
                  child: button("Buy Something",
                      () => Navigator.pushNamed(context, '/buyer/search')),
                ),
                SizedBox(height: height / 20),
                Center(
                  child: button("Sell Something",
                      () => Navigator.pushNamed(context, '/seller/imagepick')),
                )
              ]),
        ));
  }
}
