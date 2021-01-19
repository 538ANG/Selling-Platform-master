import 'package:Selling_Platform/models/local_user.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// [User] is a firebaseUser while [LocalUser]
/// is our custom created User class
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class FirebaseAuthService with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Status _status = Status.Uninitialized;

  FirebaseAuthService();
  FirebaseAuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().map(_onAuthStateChanged);
  }

  Status get status => _status;
  User get user => _user;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try{
    _status = Status.Authenticating;
    notifyListeners();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      print('signInWithGoogle succeeded: $user');
      return true;
    }
    notifyListeners();
    return false;
    } catch(err){
      print(err.toString());
      notifyListeners();
      return false;
    }
    
  }

  Future<void> signOutGoogle() async {
    print("User Signed Out");
    await googleSignIn.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (error) {
      switch (error.code) {
        case "ERROR_USER_NOT_FOUND":
          {
            print(error.code);
            return false;
          }
        case "ERROR_WRONG_PASSWORD":
          {
            print(error.code);
            return false;
          }
        default:
          {
            print(error.code);
            return false;
          }
      }
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  // -----------------------------------------------
  LocalUser _userFromFirebase(User user) {
    return user == null ? null : LocalUser(uid: user.uid);
  }

  Stream<LocalUser> get onAuthStateChanged {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future<LocalUser> signInAnonymously() async {
    final authResult = await _auth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }
}
