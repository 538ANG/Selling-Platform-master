import 'dart:io';

import 'package:flutter/material.dart';

final Color backgroundColor1 = Color(0xFF444152);
final Color backgroundColor2 = Color(0xFF6f6c7d);
final Color highlightColor = Color(0xffe0a28f);
final Color foregroundColor = Colors.white;
final AssetImage myLogo = AssetImage('assets/images/logo.png');

Widget button(String text, Function nav) {
  return FlatButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    color: Colors.white,
    onPressed: nav,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 60.0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    ),
  );
}

Widget smallButton(Icon icon, Function function) {
  return RaisedButton(
      onPressed: function,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: icon);
}

Container imageContainer(File image) {
  return Container(
    alignment: Alignment.center,
    height: 250,
    width: 250,
    decoration: BoxDecoration(
        image: DecorationImage(image: FileImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}
