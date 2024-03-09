import 'dart:convert';

import 'package:ecom/provider/auth_provider.dart';
import 'package:ecom/routes/named_routes.dart';
import 'package:ecom/screens/auth/register.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {

  final mFormKey =  GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth_Provider>(context);
    /*  /// checking is login or not
    authProvider.checkLogin(context); */
    return Scaffold(
      body: Form(
        key: mFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(height: 50,),
            Text("Login Now",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
            SizedBox(height: 20,),

            TextFormField(
              validator: (value) {
                const pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                final regExp = RegExp(pattern);
                if (value!.isEmpty) {
                  return "Email can't be empty!";
                } else if (!regExp.hasMatch(value)) {
                  return "Please enter a valid email!";
                }
              },
              controller: _emailController,
              decoration: InputDecoration(hintText: "Enter your email",
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
           SizedBox(height: 20,),

            /// pass
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(hintText: "Enter Password",
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(height: 20,),

            /// login button
            SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(

                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade400),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: (){

                if(mFormKey.currentState!.validate()){
                  /// login
                  authProvider.login(_emailController.text.toString(), _passController.text.toString(),context);

                }


              }, child: authProvider.loading ? SizedBox(height: 20,width: 20, child: CircularProgressIndicator(color: Colors.white,)) : Text("login now")),
            ),
            SizedBox(height: 50,),

            Divider(),
            SizedBox(height: 20,),
            /// reg screen button
            TextButton(
                style: ButtonStyle(/*backgroundColor: MaterialStatePropertyAll(Colors.red.shade400),*/
                  foregroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: (){


              //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyRegScreen(),));
               Navigator.pushReplacementNamed(context, MyNamedRoutes.registerScreen);

            }, child: Text("If you don have Account Click Here"))

          ],),
        ),
      ),
    );
  }
}

