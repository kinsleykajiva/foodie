import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';


class PaymentsActivity extends StatefulWidget{


  @override
  _PaymentsActivity createState() => _PaymentsActivity();


}


class _PaymentsActivity extends State<PaymentsActivity> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(
      title: Text('Payment'),
    ),drawer: AppDrawer(),);
  }

}