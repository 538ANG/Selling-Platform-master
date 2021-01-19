import 'package:Selling_Platform/utils/services/firebase_auth_service.dart';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Selling_Platform/UI/home/homePage.dart';
import 'package:provider/provider.dart';
import 'UI/buyer/buyerEnd.dart';
import 'UI/buyer/searchPage.dart';
import 'UI/profile/ProfilePage.dart';
import 'UI/seller/imagePickPage.dart';
import 'UI/seller/photoResult.dart';
import 'UI/seller/productSpec.dart';
import 'UI/seller/sellerEnd.dart';
import 'UI/welcome/loginPage.dart';
import 'UI/welcome/signUpPage.dart';
import 'UI/welcome/welcomePage.dart';
import 'package:flutter/services.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
  // FlutterFire initialization
  await Firebase.initializeApp();
runApp(
  ChangeNotifierProvider(
    create: (_) => FirebaseAuthService.instance(),
      child: MyApp()));
      }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([   
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
      ]);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: backgroundColor1));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:  WelcomePage(),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/root': (context) => WelcomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/buyer/search': (context) => SearchPage(),
          '/buyer/end': (context) => BuyerEnd(),
          '/seller/imagepick': (context) => ImagePick(),
          '/seller/result': (context)=> PhotoResult(),
          '/seller/spec': (context)=> ProductSpec(),
          '/seller/end': (context)=> SellerEnd(),
          '/profile': (context) => ProfilePage(),
        },
    );
  }
}