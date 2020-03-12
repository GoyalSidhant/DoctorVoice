import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_app/Models/User.dart';
class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User userFromFirebaseUser(FirebaseUser user){
    return user!=null?User(uid: user.uid):null;
  }
  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user)=>userFromFirebaseUser(user));
  }
  //sign in anonymously
  Future<User> signInAnon() async {
    try{
      AuthResult result= await _auth.signInAnonymously() ;
      FirebaseUser user=result.user;
      return userFromFirebaseUser(user);
    }
    catch(err){
      print("err");
      return null;
    }
  }
  //sign in with Email and Password
  Future signInWithEmailAndPassword(String email,String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    }
    catch(err){
      print("err");
      return null;
    }
  }

  //register
  Future register(String email,String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }
  //sign out
  Future logOut() async {
    try{
      await _auth.signOut();
    }
    catch(err){
      print(err.toString());
    }
  }
}