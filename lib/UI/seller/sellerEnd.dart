import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';

class SellerEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            * TODO: The following text should be based on whether the product was
                   successfully added/updated on the database.
             */
            Text("Your product has been added!", style: TextStyle(color:Colors.white)),
            SizedBox(height: 30,),
           smallButton(Icon(Icons.playlist_add_check), (){}),
          ],
        ),
      ),
    );
  }
}
