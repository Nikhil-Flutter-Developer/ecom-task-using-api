import 'package:ecom/provider/auth_provider.dart';
import 'package:ecom/routes/named_routes.dart';
import 'package:ecom/screens/auth/login.dart';
import 'package:ecom/screens/auth/register.dart';
import 'package:ecom/screens/cart_screen.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/screens/product_details.dart';
import 'package:ecom/screens/splash_screen.dart';
import 'package:ecom/screens/wish_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Auth_Provider(),)
    ],
  child: MyApp(), 
    
  ));
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

      // home: MySplashScreen(),

      initialRoute: MyNamedRoutes.splashScreen,
      routes: {
        MyNamedRoutes.splashScreen : (context) => MySplashScreen() ,
        MyNamedRoutes.homeScreen : (context) => HomePage() ,
        MyNamedRoutes.cartScreen : (context) => MyCartScreen(),
        MyNamedRoutes.wishListScreen : (context) => MyWishListScreen(),
        MyNamedRoutes.registerScreen : (context) => MyRegScreen(),
        MyNamedRoutes.loginScreen : (context) => MyLoginScreen(),
      },

    );
  }
}


