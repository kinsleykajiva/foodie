
/*this is the main utils class*/
import 'package:dio/dio.dart';
import 'package:http/http.dart' as htpp;
import 'package:http/http.dart';

class utils {


  /*user6*/
   static final String SERVER_USERNAME = "user6.atlas-sim.com";
   static final String SERVER_PASSWORD = "wpf4~3G3";

  static const String MAIN_URL = "https://user6.atlas-sim.com/";

  static String API = MAIN_URL + "app/mobile-app/backend/";

   static Future getDataEngine(){

     return htpp.get(API+'');
   }

  static Future loginUser(final username , final String password) async{
    // Response  resp ;
    Dio dio = new Client() as Dio ;
    print(API + 'response');
    var resp =  await dio.post(API + 'users',data: {
      "username":username ,
      "password":password
    });

return resp ;
  }


  static Future registerUsers(){


     return htpp.post(API + 'new');
  }
}