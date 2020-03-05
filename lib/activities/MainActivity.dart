import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';
import 'package:foodie/pojos/FoodItemPojo.dart';
import 'package:foodie/utils/utils.dart';

import 'ReadFoodItemActivity.dart';



/***/
class MainActivity extends StatefulWidget {

  MainActivity({Key key, this.title}) : super(key: key);
  String title;

  @override
  _MainActivityState createState() => _MainActivityState( utils.getFoodItems());
}


class _MainActivityState extends State<MainActivity> {
  int _counter = 0;
   List<FoodItemPojo> FoodItems=[];
  _MainActivityState(this.FoodItems);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

// _songs?.length ?? 0
  @override
  Widget build(BuildContext context) {
    /*setState(() {
      FoodItems = utils.getFoodItems();
    });*/


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[

        ],
      ),
      drawer: AppDrawer(),

      body: Center(
        child:  ListView.builder(itemBuilder: (context,position){
         return GestureDetector(
           onTap: ()=>{Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ReadFoodItemActivity(),
           settings: RouteSettings(
             arguments: FoodItems[position].name
           )))  },
             child:Container(

           width: 300,
           height: 300,
           child: Stack(
             alignment: Alignment.bottomLeft,
             children: <Widget>[
               Image.asset(

                 FoodItems[position].img,
                 width: 300,
                 height: 300,
                 fit: BoxFit.cover,
               ),
               Container(

                 color: Colors.black.withOpacity(0.5),
                 padding: const EdgeInsets.all(8.0),
                 child: Column(

                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: <Widget>[
                     Text(FoodItems[position].name, style: TextStyle(fontSize: 28)),
                     Text(FoodItems[position].description, style: TextStyle(fontSize: 22)),
                   ],
                 ),
               )
             ],
           ),
         ));
        },itemCount: FoodItems.length,)
      ),
      floatingActionButton: FloatingActionButton( onPressed: _incrementCounter,  tooltip: 'Increment', child: Icon(Icons.add),),
    );
  }
}