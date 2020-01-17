import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
          leading: IconButton(
            onPressed: (){
             Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey,),
          ),
        ),
        body: Create(),
      ),
    );
  }
}

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    final double fourScreen = MediaQuery.of(context).size.height / 6;
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              height: fourScreen,
              width: double.infinity,
             child: Center(
               child: Text("Create Account", style: TextStyle(color: Colors.blueGrey, fontSize: 27.0, fontWeight: FontWeight.w600),),
             ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13.0),
                    child: TextFormField(validator: (value){
                      if(value.isEmpty){
                        return 'Please fill the field';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'First name',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13.0),
                    child: TextFormField(validator: (value){
                      if(value.isEmpty){
                        return 'Please fill the field';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Last name',
                      ),
                    ),
                  ),

                  //Email Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13.0),
                    child: TextFormField(validator: (value){
                      if(value.isEmpty){
                        return 'Please fill the field';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Email Address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                  //Phone Number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13.0),
                    child: TextFormField(validator: (value){
                      if(value.isEmpty){
                        return 'Please fill the field';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: FlatButton(
                        onPressed: (){
                        if(formKey.currentState.validate()){
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Loading..."),));
                        }
                        },
                        child: Text("Submit", style: TextStyle(fontSize: 17, color: Colors.white),),
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

