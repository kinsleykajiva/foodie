import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';


class MainActivity extends StatefulWidget {

  MainActivity({Key key, this.title}) : super(key: key);
  String title;

  @override
  _MainActivityState createState() => _MainActivityState();
}


class _MainActivityState extends State<MainActivity> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[

        ],
      ),
      drawer: AppDrawer(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'You have pushed the button this many times:', ),
            Text('$_counter',style: Theme.of(context).textTheme.display1, ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( onPressed: _incrementCounter,  tooltip: 'Increment', child: Icon(Icons.add),),
    );
  }
}