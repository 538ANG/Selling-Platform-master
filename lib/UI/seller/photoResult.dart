import 'dart:io';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';


class PhotoResult extends StatelessWidget {
  final File image;
  PhotoResult({this.image});
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    var high = query.height;
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image != null
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: high/4),
                      child: imageContainer(this.image),
                    ),
                  )
                : Text("No image"),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                smallButton(
                    Icon(Icons.arrow_back), () => Navigator.pop(context)),
                SizedBox(width: 50),
                smallButton(Icon(Icons.navigate_next),
                    () => Navigator.pushNamed(context, "/seller/spec"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
