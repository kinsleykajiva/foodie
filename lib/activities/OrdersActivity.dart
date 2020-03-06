import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';
import 'package:foodie/pojos/FoodRequests.dart';
import 'package:foodie/utils/utils.dart';
import 'package:foodie/activities/MakeOrderActivity.dart';

class OrdersActivity extends StatefulWidget{

  @override
  _OrdersActivity createState() => _OrdersActivity(utils.getReqOrders());


}


class _OrdersActivity extends State<OrdersActivity> {
  List<FoodRequests> reqsOrders=[];
  _OrdersActivity(this.reqsOrders);
  @override
  Widget build(BuildContext context) {

    ListTile makeListTile(FoodRequests lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.format_list_bulleted, color: Colors.white),
      ),
      title: Text(
        lesson.description,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Created On Date:  "+lesson.dated_on,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: ()=>{} /*{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      }*/,
    );
    Card makeCard(FoodRequests lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: reqsOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(reqsOrders[index]);
        },
      ),
    );
    // rgb(19, 137, 253)
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(19, 137, 253, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
   /* final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );*/
    return new Scaffold(appBar: AppBar(
      title: Text('Orders'),
    ),drawer: AppDrawer(),
      body: makeBody,floatingActionButton:
        new FloatingActionButton(
         onPressed: ()=>{
           Navigator.of(context).pop(), Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MakeOrderActivity(),
               settings: RouteSettings(
                   arguments:"new"
               )))
         },
          tooltip: 'Making New Order',
          child: new Icon(Icons.add),
        ), );
  }

}