import 'package:flutter/material.dart';
import 'package:foodie/activities/LoginAcivity.dart';
import 'package:foodie/activities/FoodsActivity.dart';
import 'package:foodie/activities/PaymentsActivity.dart';
import 'package:foodie/activities/OrdersActivity.dart';

class AppDrawer extends StatelessWidget{

  Widget _createHeader(){
    return DrawerHeader(

      margin: EdgeInsets.only(top: 60.0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.contain, image: AssetImage('assets/icon_user.png'),)),
      child:Stack(children: <Widget>[
        Positioned(bottom: 12.0,left: 16.0,top: 110,child: Text("User Acc",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),),)
      ],) ,
    );
  }

  //  Navigator.pushReplacementNamed(context, Routes.casesActivity)
  @override
  Widget build(BuildContext context){
    return Drawer(

      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          ListTile(title:Text( 'Login'),trailing: Icon(Icons.contacts),onTap: ()=>{Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginAcivity()))  },),
          ListTile(title:Text( 'Foods'),trailing: Icon(Icons.contacts),onTap: ()=>{Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FoodsActivity()))  },),
          ListTile(title:Text( 'Payments'),trailing: Icon(Icons.contacts),onTap: ()=>{Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PaymentsActivity()))  },),
          ListTile(title:Text( 'Orders'),trailing: Icon(Icons.contacts),onTap: ()=>{Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OrdersActivity()))  },),

          Divider(),

        ],
      ),
    );
  }

}