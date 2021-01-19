import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';

/*
This page is where the seller enters information about the product after
uploading the pictures in the previous page (imagePickPage).
The information entered here, such as the product's category, name,
description, etc., should be updated in the database under the products uid.
*/

// TODO: Functionality to be discussed and added

class ProductSpec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Specs", style: TextStyle(color: Colors.white),),
            SizedBox(height: 30),
            smallButton(Icon(Icons.navigate_next),
                    ()=> Navigator.pushNamed(context, "/seller/end")),
          ],
        )
      ),
    );
  }
}