import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';


class OrdersActivity extends StatefulWidget{


  @override
  _OrdersActivity createState() => _OrdersActivity();


}


class _OrdersActivity extends State<OrdersActivity> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(
      title: Text('Orders'),
    ),drawer: AppDrawer(),);
  }

}