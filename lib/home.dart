import 'dart:async';
import './formScreen/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/main.dart';
import './formScreen/forgetPassword.dart';
import 'mainHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Account(),
    );
  }
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final double mainScreen = MediaQuery.of(context).size.height;
    final double threeScreen = mainScreen / 3;
    final double smallScreen = threeScreen / 3;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
            child: MyFormDone(),
          ),
      ),
    );
  }
}

class MyFormDone extends StatefulWidget {
  @override
  _MyFormDoneState createState() => _MyFormDoneState();
}

class _MyFormDoneState extends State<MyFormDone> {
  @override
  Widget build(BuildContext context) {
    final double mainScreen = MediaQuery.of(context).size.height;
    final double threeScreen = mainScreen / 3;
    final double smallScreen = threeScreen / 3;
    final double twoScreen = mainScreen / 2.5;
    final _formKeyNew = GlobalKey<FormState>();
    return Form(
      key: _formKeyNew,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: threeScreen,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: TextFormField(
                        validator: (value){
                          if(value.isNotEmpty){
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        cursorColor: Colors.blueGrey,
                        style: TextStyle(fontSize: 19.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email address',
                          suffixIcon: Icon(Icons.email, color: Colors.amber,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: TextFormField(
                        validator: (value){
                          if(value.isNotEmpty){
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        cursorColor: Colors.blueGrey,
                        style: TextStyle(fontSize: 19.0),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.lock, color: Colors.amber,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PassScreen()));
                            },
                            child: Text("Forget Password", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, fontSize: 18),),
                          ),
                          FlatButton(
                            onPressed: () async {
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Loading.."),));
                            await  Future.delayed(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount())));
                            },
                            child: Text("Create Account", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, fontSize: 18),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: threeScreen,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.amber,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1, 2),
                              blurRadius: 10.0,
                            ),
                          ]
                      ),
                      child: FlatButton(
                        onPressed: (){
                          if(_formKeyNew.currentState.validate()){
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Loading..."),));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHome()));
                          }
                        },
                        child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Or", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1, 2),
                              blurRadius: 10.0,
                            ),
                          ]
                      ),
                      child: FlatButton(
                        onPressed: () async {
                        await  signInWithGoogle().whenComplete(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainHome();
                                },
                              ),
                            );
                          });
                        },
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 0.0,
                              child:  Image.asset('assets/google.png', scale: 2,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Connect to Google", style: TextStyle(color: Colors.white, fontSize: 18),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

