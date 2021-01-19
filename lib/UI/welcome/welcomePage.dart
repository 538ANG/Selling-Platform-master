import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';

// TODO: extract some of the buttons to the utils folder for re-usability

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _loginButton() {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      onPressed: () => Navigator.pushNamed(context, "/login"),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Expanded(
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: backgroundColor1, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _signUpButton() {
    return OutlineButton(
      splashColor: Colors.white,
      borderSide:
          BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      highlightedBorderColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, "/signup"),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          Text(
            'Skip to home',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          // Icon(Icons.fingerprint, size: 90, color: Colors.white),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: Text(
              'HERE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget logo() {
    return Image(
      image: myLogo,
      height: 100,
      width: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: height,
          width: width,
          // decoration: BoxDecoration(
          //   color: backgroundColor1,
          //   image: DecorationImage(
          //     colorFilter: new ColorFilter.mode(
          //         Colors.black.withOpacity(0.1), BlendMode.dstATop),
          //     fit: BoxFit.cover,
          //   ),
          // ),
           decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundColor1, backgroundColor2])
                  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // _title(),
              logo(),
              SizedBox(
                height: 80,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              _divider(),
              _loginButton(),
              SizedBox(
                height: 20,
              ),

              _label()
            ],
          )),
    );
  }
}
