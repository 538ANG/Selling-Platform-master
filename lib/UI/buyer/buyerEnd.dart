import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';

class BuyerEnd extends StatefulWidget {
  @override
  SearchEndState createState() => SearchEndState();
}

class SearchEndState extends State<BuyerEnd> {
  @override
  Widget build(BuildContext context) {
     var query = MediaQuery.of(context).size;
    var high = query.height;
    return Scaffold(
      backgroundColor: backgroundColor1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("We will get back to you, Later!",
            style: TextStyle(
              color: Colors.white, fontSize: 20
              ),
            ),
            SizedBox(height: high/10),
            Center(
              child: button("Finish", ()=> Navigator.pushReplacementNamed(context, '/home')),
            )
          ]));
  }
}