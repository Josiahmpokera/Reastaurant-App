import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final double minimalHeight = MediaQuery.of(context).size.height / 3;
    final double minSmall = minimalHeight / 4;
    final double tripleWidth = MediaQuery.of(context).size.width / 3;
    return Column(
      children: <Widget>[
        Container(
          height: minimalHeight,
          width: double.infinity,
          child: Center(
            child: Container(
              height: 120.0,
              width: 120.0,
              child: Image.asset('assets/logo.png'),
            ),
          ),
        ),
        Container(
          height: minimalHeight,
          width: double.infinity,
          child: Center(
            child: Image.asset('assets/burger.png'),
          ),
        ),
        Container(
          height: minSmall,
          width: double.infinity,
          color: Colors.orangeAccent,
        ),
        Container(
          height: minSmall,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: tripleWidth,
              ),
              Container(
                width: tripleWidth,
                child: Center(
                  child: Text("Swipe", style: TextStyle(letterSpacing: 2, fontSize: 20.0, color: Colors.white),),
                ),
              ),
              Container(
                width: tripleWidth,
                child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
              ),
            ],
          ),
        ),
        Container(
          height: minSmall,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              SizedBox(width: tripleWidth,),
              Container(
                width: tripleWidth,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: tripleWidth,),
            ],
          ),
        ),
      ],
    );
  }
}
