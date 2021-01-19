import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocalUser {
  String uid;
  String name;
  String profilePicURL;
  String email;
  double rating;
  int raters; //number of people who rated

  //TODO: items are supposed to be the user's old/new items bought or sold
  List<Widget> items = [Text("No items to show yet!")];

  LocalUser({@required this.uid, this.name, this.profilePicURL, this.email,
        this.rating, this.raters, this.items});


  factory LocalUser.fromFirebaseOnlyID(User user){
    return user == null ? null : LocalUser(uid: user.uid);
  }

  LocalUser.fromFirebase(User user){
    assert (!user.isAnonymous);
    LocalUser(
      uid: user.uid,
      name: user.displayName,
      profilePicURL: user.photoURL,
      email: user.email,
    );
  }

  // for dev purposes
  LocalUser.defaultUser()
      : name = 'Elon Musk',
        email = 'Elon@theboringcompany.com',
        profilePicURL = "assets/images/elon.jpg",
        rating = 3.5,
        raters = 0;

// var get getImage; //TODO: this will get the user's profile pic
// var get getRating; //TODO: this will get the user's rating
// var get getRaters; //TODO: this will get the user's raters

}



