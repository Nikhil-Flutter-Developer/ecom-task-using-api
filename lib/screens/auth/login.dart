import 'dart:convert';

import 'package:ecom/screens/auth/register.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  var _emailController = TextEditingController();
  var _passController = TextEditingController();

  void checkLogin ()async {
  var prefs = await SharedPreferences.getInstance();
var key =   prefs.getString("loginKey");
if(key != null && key != "" ){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));

}else{print("need to login prefs is empty");}

  }
  @override
  void initState() {
    checkLogin();
    // TODO: implement initState
    super.initState();
  }

  void login (String email , String password) async {

    try{
/// hiting post api for login
Response response = await post (Uri.parse("https://www.infusevalue.live/api/v1/auth/login"),
body: {
  "email": email,
  "password":password,
}
);

/// checking status code of response
if(response.statusCode == 200){
  var data = jsonDecode(response.body.toString());
  var prefs = await SharedPreferences.getInstance();
 print("login successful ") ;
 print(data["token"]);


 /// sharing login key to shared prefs which is comming from respose.body api
await prefs.setString("loginKey", data["token"] );
print("saved");
 /// Navigating to home screen
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));


 _emailController.clear();
 _passController.clear();

} else{
  print("error");
}


    }catch(e){
print(e);
}


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SizedBox(height: 20,),

          TextField(controller: _emailController,
          decoration: InputDecoration(hintText: "email"),
          ),
         SizedBox(height: 20,),
          TextField(controller: _passController,
            decoration: InputDecoration(hintText: "pass"),
          ),
          SizedBox(height: 20,),

          /// login button
          ElevatedButton(onPressed: (){
            login(_emailController.text.toString(),_passController.text.toString());
          }, child: Text("login now")),
          SizedBox(height: 20,),


          /// reg screen button
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyRegScreen(),));
          }, child: Text("do not have ac"))

        ],),
      ),
    );
  }
}
