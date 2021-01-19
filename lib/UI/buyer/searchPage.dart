import 'package:flutter/material.dart';

/*
  TODO:
      1- save user's search string to the cloud under UserID
      2- restrict search string (language, length, etc.)
      3- add a fun fact or some dynamically generated fun statement (optional)
*/
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    var high = query.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'What are you Looking for?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: high/12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter Item Name Here",
                  suffixIcon: IconButton(
                    onPressed: () => _controller.clear(),
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: ()=>Navigator.pushNamed(context, "/buyer/end"), color: Colors.blue, child: Text('search'))
          ],
        ),
      ),
    );
  }
}     