import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/rating_stars.dart';
import '../../models/local_user.dart';

/*
  TODO:
    1- update ProfilePage so it shows as a burger menu throughout the app;
    currently it only shows in the HomePage.
    2- add functionality to profile pic when pressed.
 */


class ProfilePage extends StatefulWidget {
  final LocalUser user;

  ProfilePage()
    : this.user = LocalUser.defaultUser(); // initializer list

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    body: Column(
      children: <Widget>[
        ImageIcon(AssetImage(widget.user.profilePicURL)),
        Text(widget.user.name),
        Text(widget.user.email),
        FlatButton(
            onPressed: () {},
            child: Icon(Icons.person)),
        RatingStars(widget.user.rating,widget.user.raters),
        Expanded(
            child:ListView(
                children:widget.user.items
            )
        ),
      ]
    ));
  }
}
