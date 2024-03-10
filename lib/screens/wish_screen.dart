import 'dart:convert';
import 'package:ecom/custom_widgets/custom_widget.dart';
import 'package:ecom/model/wish_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_helper/api_helper.dart';
import '../model/cart_list_model.dart';

class MyWishListScreen extends StatefulWidget {
  const MyWishListScreen({super.key});

  @override
  State<MyWishListScreen> createState() => _MyWishListScreenState();
}

class _MyWishListScreenState extends State<MyWishListScreen> {
String? id = "id";
  bool noProductsInWishList = false;
  List<dynamic> wishListItems = [] ;


  void getCartProducts() async {

    try{
      final response = await http.get(
        Uri.parse(ApiList.Get_Wish_List_Get_Api),
        headers: {
          'Authorization': 'Bearer ${ApiList.gettoken()}',
          'Content-Type': 'application/json', // Adjust content type if needed
        },

      );

      if(response.statusCode == 200 ){

        List<dynamic> jsonData = jsonDecode(response.body.toString());
   jsonData.length != 0 ?
   print("response code is 200 ${jsonData[0]["id"]} ") :
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.pink,
           behavior: SnackBarBehavior.floating,
           margin: EdgeInsets.only(
             //  top: 100,
             bottom: MediaQuery.of(context).size.height * 0.8,
           ),
           content: Text("No products here continue shoping")));

   if(jsonData.length == 0){
     noProductsInWishList = true;
   }
       // print(jsonData);
        setState(() {

        });


        wishListItems.addAll(jsonData)  ;
        setState(() {

        });
      }

    }catch (e) {
      print(" error $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCartProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
     /* appBar: AppBar(title: Text(" Your Wish List "),
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),*/
      body: Center(

        child: Container(
          padding: EdgeInsets.all(12),
          child:  /* FutureBuilder(
            future: getCartProducts(),
            builder: (context, snapshot) => ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.all(12),
                color: Colors.pink,
              ),),)*/

          Column(
            children: [

              wishListItems.length == 0 ?  noProductsInWishList ? Text("No Products Here Continue shoping"):CircularProgressIndicator() :
              Expanded(
                child: ListView.builder(
                  itemCount: wishListItems.length,
                  itemBuilder: (context, index) => Container(
                    height: 160,
                    width: double.infinity,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.all(Radius.circular(24))
                    ),

                    child: Row(
                      children: [

                        /// product thumbnail
                      /*  Container(
                          width: 120,height: 120,
                          // padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),
                              image: DecorationImage(image: NetworkImage("${BaseUrl.thumbnail_Base_Url}${wishListItems[0][id]}"))
                          ),
                        ),*/

                        /// Name

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6,),
                                SizedBox(
                                    width: double.infinity,
                                    child: Text("Id : ${wishListItems[index]["id"]}",softWrap: true,overflow: TextOverflow.clip,)),
                                SizedBox(height: 6,),
                                SizedBox(
                                    width: double.infinity,
                                    child: Text("product id : ${wishListItems[index]["product"]["id"]}",softWrap: true,overflow: TextOverflow.clip,)),
                                SizedBox(height: 6,),
                                Text(" slug : ${wishListItems[index]["product"]["slug"]}",softWrap: false,overflow: TextOverflow.clip,),
                                SizedBox(height: 6,),


                                ///  remove item from cart
                                IconButton(onPressed: () {
                                  removeFromWishList("${wishListItems[index]["product"]["id"]}");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyWishListScreen(),));
                                }, icon: Icon(Icons.delete)),

                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),),
              ),



              /// Total price to pay

              /// order now
            ],
          ),
        ),
      ),
    );
  }


  void removeFromWishList ( String productId ) async {
    var token =  ApiList.gettoken();
    try{
      final response = await http.delete(
          Uri.parse(ApiList.remove_From_Wish_List_Delet_Api),
          headers: {
            'Authorization': 'Bearer $token',            //user login token id
            // 'Content-Type': 'application/json', // Adjust content type if needed
          },
          body: {
            "product_id": productId,
          }
      );

      if(response.statusCode == 200){

      //  print("code200");
        setState(() {

        });
      }

    }catch (e) {
      print(" error $e");
    }

  }
}
