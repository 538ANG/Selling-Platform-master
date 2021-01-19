import 'package:Selling_Platform/UI/home/homePage.dart';
import 'package:Selling_Platform/utils/services/firebase_auth_service.dart';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
* TODO: 1- extract buttons/services for re-usability and shorter code
        2- Add logging in using Google functionality
 */

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _loginButton(Function function) {
      return FlatButton(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30.0)
        //     ),
        color: highlightColor,
        onPressed: function,
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
                      color: foregroundColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _googleLoginButton(Function function) {
      return FlatButton(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30.0)
        //     ),
        color: Colors.red[300],
        onPressed: function,
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
                  "google+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _forgetPasswordButton() {
      return FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        color: Colors.transparent,
        onPressed: () => {},
        child: Text(
          "Forgot your password?",
          style: TextStyle(color: foregroundColor.withOpacity(0.5)),
        ),
      );
    }

    Widget _goSignup() {
      return FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        color: Colors.transparent,
        onPressed: () => Navigator.pushNamed(context, "/signup"),
        child: Text(
          "Don't have an account? Create One",
          style: TextStyle(color: foregroundColor.withOpacity(0.5)),
        ),
      );
    }

    Widget _field(
        TextEditingController myController, bool isPass, String hint) {
      return TextField(
        obscureText: isPass,
        controller: myController,
        cursorColor: highlightColor,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: foregroundColor),
        ),
      );
    }

    final user = Provider.of<FirebaseAuthService>(context);
    return Scaffold(
      key: _key,
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
              end: new Alignment(
                  1.0, 0.0), // 10% of the width, so there are ten blinds.
              colors: [backgroundColor1, backgroundColor2], // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 150.0, bottom: 50.0),
                child: Center(
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 128.0,
                        width: 128.0,
                        child: new Text(
                          "",
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(image: myLogo)),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Text(
                          "",
                          style: TextStyle(color: foregroundColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: foregroundColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.alternate_email,
                        color: foregroundColor,
                      ),
                    ),
                    new Expanded(
                        child: _field(emailController, false, 'Email')),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: foregroundColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.lock_open,
                        color: foregroundColor,
                       ),
                    ),
                    Expanded(
                        child: _field(passwordController, true, 'Password')),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: _loginButton(
                      () async {
                        if (!await user.signIn(emailController.text.trim(),
                            passwordController.text.trim())) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text("Something is wrong"),
                          ));
                        } else {
                          Navigator.pushReplacementNamed(context, "/home");
                        }
                      },
                    )),
                    SizedBox(width: 20,),
                    new Expanded(
                      child: _googleLoginButton(() {
                        user.signInWithGoogle().then((result) {
                          if (result != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                            );
                          }
                        });
                      }),
                    )
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: _forgetPasswordButton()),
                  ],
                ),
              ),
              user.status == Status.Authenticating
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: highlightColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(backgroundColor2),
                    ))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
              new Expanded(
                child: Divider(),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: _goSignup()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
