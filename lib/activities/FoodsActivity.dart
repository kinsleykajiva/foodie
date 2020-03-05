import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';


class FoodsActivity extends StatefulWidget{


  @override
  _FoodsActivity createState() => _FoodsActivity();


}


class _FoodsActivity extends State<FoodsActivity> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(
      title: Text('Foods'),
    ),drawer: AppDrawer(),);
  }

}