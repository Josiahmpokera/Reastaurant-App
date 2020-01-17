import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        title: Text("P&P", style: TextStyle(fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.w600),),
      ),
    );
  }
}
