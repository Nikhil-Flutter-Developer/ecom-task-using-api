import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});
  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {

        final authProvider = Provider.of<Auth_Provider>(context,listen: false);
        /// checking is login or not
        authProvider.checkLogin(context);

    });

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text("Ecom app by Nikhil",style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
