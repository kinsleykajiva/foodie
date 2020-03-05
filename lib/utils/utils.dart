/*this is the main utils class*/
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie/pojos/FoodItemPojo.dart';
import 'package:http/http.dart' as htpp;
import 'package:http/http.dart';

class utils {

  static  List<FoodItemPojo>  foodItemPojo_List = new List() ;
  static String food = """

[
		{
			"name":"food 1",
			"price":"234.32" ,
			"description":"324 description 1",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 2",
			"price":"23345344.32" ,
			"description":"324 description 333",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 3",
			"price":"33.32" ,
			"description":"324 4444 333",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 33",
			"price":"4433.32" ,
			"description":"324 4444 333",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 656",
			"price":"453.32" ,
			"description":"Asds asdas 333",
			"img":"assets/fooder.jpeg"
		},
		{
			"name":"food 454",
			"price":"453.32" ,
			"description":"sdf asdas 333",
			"img":"assets/fooder.jpeg"
		}
	]


""";

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
