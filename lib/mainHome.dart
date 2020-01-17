import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  int _pages = 0;
  final _pagesOption = [
      Text("Page one"),
      Text("Page Two"),
      Text("Page Three"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        leading: Icon(Icons.restaurant, color: Colors.black, size: 34,),
        title: Text("P&P", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black, size: 34,),)
        ],
      ),
      body: _pagesOption[_pages],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor: Colors.orange,
        currentIndex: _pages,
        onTap: (int index){
          setState(() {
            _pages = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Home"),
          ),
        ],
      ),
    );
  }
}
