
import 'dart:convert';

import 'package:ecom/api_helper/api_helper.dart';
import 'package:ecom/routes/named_routes.dart';
import 'package:ecom/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';

class Auth_Provider with ChangeNotifier {
 bool _isloading = false;

 /// getter
 bool get loading{
   return _isloading ;
 }
 /// setter
 setloading (bool value){
   _isloading = value ;
   notifyListeners();
 }




/// isLogin or not
 void checkLogin (context)async {
   var prefs = await SharedPreferences.getInstance();
   var key =   prefs.getString("loginKey");
   if(key != null && key != "" ){
     await ApiList.settoken("$key");
    // print("isLogin Api token set and get value is :: ${ApiList.gettoken()}");
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
 Navigator.pushReplacementNamed(context, MyNamedRoutes.homeScreen);
   }else{
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLoginScreen(),));
   Navigator.pushReplacementNamed(context, MyNamedRoutes.loginScreen) ;
   }

 }



  /// login
  void login(String email, String password ,context) async {
    setloading(true);
    try{
      /// hiting post api for login
      Response response = await post(Uri.parse("https://www.infusevalue.live/api/v1/auth/login"),
          body: {
            "email": email,
            "password":password,
          }
      );

      /// checking status code of response
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        var prefs = await SharedPreferences.getInstance();

        print("login succefully");

        /// sharing login key to shared prefs which is comming from respose.body api
        await ApiList.settoken("${data["token"]}");

        await prefs.setString("loginKey", data["token"] );
        print("log auth token saved");
        /// Navigating to home screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        setloading(false);

      } else{
        setloading(false);
        print("Login failed ");
      }

    } catch (e){
      setloading(false);
      print("erron on login auth is  :: $e ");
    }

  }


/// register
 void reg (String firstName,String lastName, String mobile,String email ,String password,context) async {
   setloading(true);
   try{
     /// hiting post api for Reg
     Response response = await post (
         Uri.parse("https://www.infusevalue.live/api/v1/auth/register"),
         body: {
           "f_name":firstName,
           "l_name":lastName,
           "email":email,
           "phone": mobile,
           "password":password,
         }
     );

     /// checking status code of response
     if(response.statusCode == 200){
       var data = jsonDecode(response.body.toString());
       var prefs = await SharedPreferences.getInstance();
       print("Register successful ") ;
       await ApiList.settoken("${data["token"]}");
       setloading(false);

       /// storing login key to shared prefs which is coming from response.body api
       prefs.setString("loginKey", data["token"] ?? "" );
       print("saved");
       /// Navigating to home screen
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));

     } else{
       setloading(false);
       print("error");
     }


   }catch(e){
     setloading(false);
     print( " e Reg : $e");
   }


 }





  /// Register



}