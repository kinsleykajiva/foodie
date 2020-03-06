/*this is the main utils class*/
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie/pojos/FoodItemPojo.dart';
import 'package:foodie/pojos/FoodRequests.dart';
import 'package:http/http.dart' as htpp;
import 'package:http/http.dart';

class utils {

  static  List<FoodItemPojo>  foodItemPojo_List = new List() ;
  static  List<FoodRequests>  OrdersPojo_List = new List() ;
  static String food = """

[
		{
			"name":"Rice ",
			"price":"23.32" ,
			"description":"Chicken /7 rice",
			"img":"assets/food2.jpeg"
		},
		{
			"name":"Paapa",
			"price":"6.32" ,
			"description":"Paap & Beef",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"Ico Cream",
			"price":"33.32" ,
			"description":"Choc - Icream ",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"Sugar 33",
			"price":"4.32" ,
			"description":"---",
			"img":"assets/food2.jpeg"
		},
		{
			"name":"food 656",
			"price":"43.32" ,
			"description":"food food",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 454",
			"price":"413.32" ,
			"description":"Rices",
			"img":"assets/fooder.jpeg"
		}
	]


""";

  static String orders_requetss = """
  
  [
		{
		  "id":"0",
			"user_emplyee_name":"User Name",			
			"description":"324 description 1",
			"dated_on":"2019-03-01"
		},
		{
		  "id":"1",
			"user_emplyee_name":"User Name",			
			"description":"324 description 1",
			"dated_on":"2019-03-01"
		},
		{
		  "id":"2",
			"user_emplyee_name":"User Name",			
			"description":"324 description 1",
			"dated_on":"2019-03-01"
		}
]

  
  """;
  static List<FoodRequests> getReqOrders(/*String j*/) {
    var parse = json.decode(orders_requetss);
    List<FoodRequests> items = [];
    for (var u in parse) {
      // print("-----");
      ///   print(u);
      FoodRequests itt = FoodRequests(u["id"],u["user_emplyee_name"], u["description"], u["dated_on"]);
      items.add(itt);
    }

    OrdersPojo_List = items ;
    return items;
  }
  /*user6*/
  static final String SERVER_USERNAME = "user6.atlas-sim.com";
  static final String SERVER_PASSWORD = "wpf4~3G3";

  static const String MAIN_URL = "https://user6.atlas-sim.com/";

  static String API = MAIN_URL + "app/mobile-app/backend/";

  static Future getDataEngine() {
    return htpp.get(API + '');
  }


  static List<FoodItemPojo> getFoodItems(/*String j*/) {
    var parse = json.decode(food);
    List<FoodItemPojo> items = [];
    for (var u in parse) {
     // print("-----");
   ///   print(u);
      FoodItemPojo itt = FoodItemPojo(u["name"], double.parse(u["price"]), u["description"], u["img"]);
      items.add(itt);
    }

    foodItemPojo_List = items ;
    return items;
  }

  static Future loginUser(final username, final String password) async {
    // Response  resp ;
    Dio dio = new Client() as Dio;
    print(API + 'response');
    var resp = await dio.post(API + 'users', data: {"username": username, "password": password});
    return resp;
  }


  static Future registerUsers() {
    return htpp.post(API + 'new');
  }
}
