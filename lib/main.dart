import 'package:ecom/screens/auth/login.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/screens/product_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

 //  home: ProductDetailsPage(),
      home: MyLoginScreen(),
      //  home: MyHomeScreen(),
    );
  }
}


