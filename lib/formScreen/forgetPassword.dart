import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassScreen extends StatefulWidget {
  @override
  _PassScreenState createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pass(),
    );
  }
}

class Pass extends StatefulWidget {
  @override
  _PassState createState() => _PassState();
}

class _PassState extends State<Pass> {
  @override
  Widget build(BuildContext context) {
    final double formHeight = MediaQuery.of(context).size.height / 2;
    final double threeForm = formHeight / 3;
    final double fouForm = formHeight / 4;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back, size: 30, color: Colors.black,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: threeForm,
              width: double.infinity,
              child: Center(
                child: Text("Forget Password?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
              ),
            ),
            Container(
              height: threeForm,
              width: double.infinity,
              child: Center(
                child: Image.asset('assets/sms.png'),
              ),
            ),
            Container(
              height: threeForm,
              width: double.infinity,
             child: Center(
               child: Text("You will geta Code for reset\n Password via SMS", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey),),
             ),
            ),
            Container(
              height: formHeight,
              width: double.infinity,
              child: MyCustomForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter a Email Address',
                 filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  errorStyle: TextStyle(fontSize: 14.0, letterSpacing: 1),
                ),
                textInputAction: TextInputAction.done,
                validator: (value){
                  if(value.isEmpty){
                    return 'Please fill this Field';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(7),
              ),
              width: double.infinity,
              child:  FlatButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("Processing Data"),));
                  }
                },
                child: Text("Get A Code", style: TextStyle(color: Colors.white, fontSize: 17),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





