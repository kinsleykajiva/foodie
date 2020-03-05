import 'package:flutter/material.dart';
import 'package:foodie/cwidgets/AppDrawer.dart';
import 'package:foodie/pojos/FoodItemPojo.dart';
import 'package:foodie/utils/utils.dart';

class ReadFoodItemActivity extends StatefulWidget{



  @override
  _ReadFoodItemActivity createState() => _ReadFoodItemActivity();


}


class _ReadFoodItemActivity extends State<ReadFoodItemActivity> {
    FoodItemPojo foodItemPojo;

  @override
  Widget build(BuildContext context) {

    final String namePassed = ModalRoute.of(context).settings.arguments;
    for(var i = 0 ; i<utils.foodItemPojo_List.length;i++){
      FoodItemPojo foodItemPojo_ = utils.foodItemPojo_List.elementAt(i) ;
      if(foodItemPojo_.name == namePassed ){
        foodItemPojo = foodItemPojo_ ;
        break;
      }
    }
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 1,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );
    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\R" + foodItemPojo.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          foodItemPojo.name,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(""
                      /*"lesson.level"*/,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );
    final bottomContentText = Text(
      foodItemPojo.description,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Buy/Add To Cart", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );
    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(foodItemPojo.img),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
   // print(namePassed);
    return new Scaffold(appBar: AppBar(
      title: Text('Food Detail '  ),
    ),
      body: Center(
        child: Column(
        children:<Widget>[
          topContent, bottomContent
        ]),
      ),
    );
  }

}