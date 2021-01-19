import 'package:Selling_Platform/utils/services/firebase_auth_service.dart';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
* TODO: 1- extract buttons/services for re-usability and shorter code
        2- Add sign up using Google
 */

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Widget _signupButton(Function function) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      color: highlightColor,
      onPressed: function,
      child: Text(
        "Sign Up",
        style: TextStyle(color: foregroundColor),
      ),
    );
  }

  void signupDo(Future future) {
    setState(() {
      // future = signup(
      //     emailController.text.trim(), passwordController.text.trim());
    });
  }

  Widget _field(TextEditingController controller, bool isPass, String hint) {
    return TextField(
      obscureText: isPass,
      controller: controller,
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseAuthService>(context);
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: new Alignment(
                1.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [backgroundColor1, backgroundColor2], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
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
                  new Expanded(child: _field(emailController, false, 'Email')),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
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
                  Expanded(child: _field(passwordController, true, 'Password')),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(child: _signupButton(() async {
                    if (!await user.register(emailController.text.trim(),
                        passwordController.text.trim())) {
                      _key.currentState.showSnackBar(SnackBar(
                        content: Text("Something is wrong"),
                      ));
                    } else{
                          Navigator.pushReplacementNamed(context, "/login");
                    }
                  })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
