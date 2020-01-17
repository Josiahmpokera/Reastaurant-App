import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './viewPager/pageOne.dart';
import './viewPager/pageTwo.dart';
import './viewPager/pageThree.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'P&P',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
        body: PageView(
          children: <Widget>[
            //The First Page
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        ),
    );
  }
}

