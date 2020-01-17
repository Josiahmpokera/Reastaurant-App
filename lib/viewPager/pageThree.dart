import 'package:flutter/material.dart';
import 'package:restaurant_app/home.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
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
            child: Text("Get Delicious \nFood Now!", style: TextStyle(fontSize: 35.0, color: Colors.white, letterSpacing: 3),),
          ),
        ),
        Container(
          height: minimalHeight,
          width: double.infinity,
          child: Center(
            child: Image.asset('assets/sandwich.png', ),
          ),
        ),
        Container(
          height: minSmall,
          width: double.infinity,
          color: Colors.orangeAccent,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: minSmall,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.green,
          ),
          child: FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewHome()));
            },
            child: Text('Get Started', style: TextStyle(fontSize: 18.0, color: Colors.white),),
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
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
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
