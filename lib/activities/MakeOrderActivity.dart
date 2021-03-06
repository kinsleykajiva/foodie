import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';
import 'package:foodie/utils/utils.dart';
import 'package:loading_overlay/loading_overlay.dart';

class MakeOrderActivity extends StatefulWidget{


  @override
  _MakeOrderActivity createState() => _MakeOrderActivity();


}


class _MakeOrderActivity extends State<MakeOrderActivity> {
  final  _usernameController = TextEditingController();
  final  _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isInvalidAsyncUser = false; // managed after response from server
  void _loginUser(){

    String username = _usernameController.text;
    String password = _passwordController.text;
    void _showErrorDialog(String Message) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog"),
            content: new Text(Message),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
// dismiss keyboard during async call
    FocusScope.of(context).requestFocus(FocusNode());
    // start the modal progress HUD
    setState(() {
      _isLoading = true;
    });
    var ress =utils.loginUser(username ,password);
    ress.then((response){
      final int statusCode = response.statusCode;
      print(response);
      setState(() {
        _isLoading = false;
      });
    }).catchError((onError){
      print(onError);
      _showErrorDialog("Failed to connect To the server");
      setState(() {
        _isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body:LoadingOverlay(

          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 0.0,top: 30.0,right: 0.0,bottom: 0.0),
                height: 190,
                decoration: BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage('assets/food2.jpeg'),
                        fit: BoxFit.contain,

                        alignment: Alignment.topCenter
                    )
                ),

                padding: EdgeInsets.all(0.0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.1),
                      child: Text(
                        "Make An Order",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.blueAccent
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 190),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(
                    children: <Widget>[
                      /* Center(
                  child: Text("Login",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 25,),
                      textDirection: TextDirection.ltr),
                ),*/
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                          color: Color(0xfff5f5f5),
                          child: TextFormField(
                            controller: _usernameController,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFUIDisplay'
                            ),
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                labelText: 'Food Description',
                                prefixIcon: Icon(Icons.info),
                                labelStyle: TextStyle(
                                    fontSize: 15
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: false,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SFUIDisplay'
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Addition Info',
                              prefixIcon: Icon(Icons.info),
                              labelStyle: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          onPressed: (){_loginUser();},//since this is only a UI app
                          child: Text('Order',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SFUIDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Color(0xffff2d55),
                          elevation: 0,
                          minWidth: 400,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ), isLoading: _isLoading,progressIndicator: CircularProgressIndicator(),));
  }

}