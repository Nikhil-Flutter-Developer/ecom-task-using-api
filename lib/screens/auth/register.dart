import 'dart:convert';

import 'package:ecom/provider/auth_provider.dart';
import 'package:ecom/screens/auth/login.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/named_routes.dart';


class MyRegScreen extends StatefulWidget {
  const MyRegScreen({super.key});

  @override
  State<MyRegScreen> createState() => _MyRegScreenState();
}

class _MyRegScreenState extends State<MyRegScreen> {
  final mFormKey = GlobalKey<FormState>();
  var _f_Name = TextEditingController();
  var _l_Name = TextEditingController();
  var _mobile = TextEditingController();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  var   authProvider =   Provider.of<Auth_Provider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: mFormKey,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 20,),
              Text("Create Account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),

              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){return "Name can't be empty!";}
                  },
                controller: _f_Name,
                decoration: InputDecoration(hintText: "First Name",
                    suffixIcon: Icon(Icons.account_circle_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),

              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){return "Last Name can't be empty!";}
                },
                controller: _l_Name,
                decoration: InputDecoration(hintText: "Last Name",
                    suffixIcon: Icon(Icons.account_circle_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))

                ),
              ),


              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.number,
                validator: (mobileNo){

                  if(mobileNo!.length < 10 && mobileNo!.length > 10){return "Pleas enter 10 digit valid No!";}
                  else if(mobileNo.isEmpty){ return "Please Enter a valid 10 digit No" ;}

                  } ,
                controller: _mobile,
                decoration: InputDecoration(hintText: "Mobile no",
                    suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),

              SizedBox(height: 20,),

              TextFormField(

                keyboardType: TextInputType.emailAddress,
                validator: (email){
                  if(email!.length < 10){return "Pleas enter 10 digit valid No!";}
                },
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter Your Email Address",
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))

                ),
              ),

              SizedBox(height: 20,),

              TextFormField(
                validator: (pass){
                  if(pass!.length < 6 ){return "please select 8 digit valid password";}
                },
                controller: _passController,
                decoration: InputDecoration(hintText: "password",
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: 20,),

              /// Register button
              SizedBox(
                width: 150,
                height: 30,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade400),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: (){

                  if(mFormKey.currentState!.validate()){
                    authProvider.reg(_f_Name.text.toString(),_l_Name.text.toString(),_mobile.text.toString(),_emailController.text.toString(),_passController.text.toString(),context);
                  }

                }, child: authProvider.loading ? SizedBox(height: 15,width: 15, child: CircularProgressIndicator(color: Colors.white,)) : Text("Register Now")),
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

                //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLoginScreen(),));
                    Navigator.pushReplacementNamed(context, MyNamedRoutes.loginScreen);


                  }, child: Text("If you allready have Account Click Here"))




            ],),
          ),
        ),
      ),
    );
  }
}
