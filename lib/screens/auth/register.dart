import 'dart:convert';

import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyRegScreen extends StatefulWidget {
  const MyRegScreen({super.key});

  @override
  State<MyRegScreen> createState() => _MyRegScreenState();
}

class _MyRegScreenState extends State<MyRegScreen> {
  var _f_Name = TextEditingController();
  var _l_Name = TextEditingController();
  var _mobile = TextEditingController();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();

  void reg (String firstName,String lastName, String mobile,String email , String password) async {
print(mobile);
    try{
      /// hiting post api for Reg
      Response response = await post (Uri.parse("https://www.infusevalue.live/api/v1/auth/register"),
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
        print(data["token"]);


        /// storing login key to shared prefs which is coming from response.body api
        prefs.setString("loginKey", data["token"] ?? "" );
        print("saved");
        /// Navigating to home screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeScreen(),));


        _emailController.clear();
        _passController.clear();

      } else{
        print("error");
      }


    }catch(e){
      print( " e Reg : $e");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SizedBox(height: 20,),

          TextField(controller: _f_Name,
            decoration: InputDecoration(hintText: "First Name"),
          ),
          SizedBox(height: 20,),


          TextField(controller: _l_Name,
            decoration: InputDecoration(hintText: "Last Name"),
          ),
          SizedBox(height: 20,),


          TextField(controller: _mobile,
            decoration: InputDecoration(hintText: "Mobile no"),
          ),
          SizedBox(height: 20,),


          TextField(controller: _emailController,
            decoration: InputDecoration(hintText: "email"),
          ),
          SizedBox(height: 20,),


          TextField(controller: _passController,
            decoration: InputDecoration(hintText: "pass"),
          ),
          SizedBox(height: 20,),

          /// Register button
          ElevatedButton(onPressed: (){
            reg(_f_Name.text.toString(),_l_Name.text.toString(),_mobile.text.toString(),_emailController.text.toString(),_passController.text.toString());
          }, child: Text("Register now")),
          SizedBox(height: 20,),


          /// login screen button
          ElevatedButton(onPressed: (){        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeScreen(),));
          }, child: Text("go to Login screen"))

        ],),
      ),
    );
  }
}
