import 'dart:convert';

import 'package:ecom/api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_list_model.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

 bool noProductsCart = false ;
  List<CartProduct> productsInCart = [] ;
  List<CartProduct> parseCartProducts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CartProduct>((json) => CartProduct.fromJson(json)).toList();
  }
  /*List<CartProduct> parseCartProducts(String responseBody) {
    final List<dynamic> parsed = jsonDecode(responseBody);
    List<CartProduct> cartProducts = [];
    for (var item in parsed) {
      cartProducts.add(CartProduct.fromJson(item));
    }
    return cartProducts;
  }*/


  void getCartProducts() async {
    var prefs = await SharedPreferences.getInstance();
  var  token = prefs.getString("loginKey");

  try{
    final response = await http.get(
      Uri.parse(ApiList.cart_products_List_Get_Api),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Adjust content type if needed
      },

    );

    if(response.statusCode == 200){
     var jsonData = jsonDecode(response.body);
      print("response code is 200");
      if(jsonData.length == 0){
        noProductsCart = true;
      }
      setState(() {

      });
       List<CartProduct> fetchAllProducts = parseCartProducts(response.body);

      productsInCart.addAll(fetchAllProducts)  ;
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
      appBar: AppBar(title: Text(" Your Cart "),
      centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
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
              productsInCart.length == 0 ? noProductsCart ? Text("No Products Here Continue shoping"):CircularProgressIndicator() :
              Expanded(
                child: ListView.builder(
                  itemCount: productsInCart.length,
                  itemBuilder: (context, index) => Container(
                    height: 160,
                  width: double.infinity,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(24))
                  ),

                    child: Row(
                      children: [

                        /// product thumbnail
                        Container(
                          width: 120,height: 120,
                         // padding: const EdgeInsets.all(8.0),
                         margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(image: NetworkImage("${BaseUrl.thumbnail_Base_Url}${productsInCart[index].thumbnail}"))
                          ),
                        /*  child : Image.network("${BaseUrl.thumbnail_Base_Url}${productsInCart[index].thumbnail}",fit: BoxFit.fill,
                           ),*/
                        ),

                        /// Name

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4,),
                                Text("${productsInCart[index].name}",softWrap: true,overflow: TextOverflow.clip,),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text("Price :\$${productsInCart[index].price}",softWrap: true,overflow: TextOverflow.clip,),
                                    SizedBox(width: 10,),
                                    Text("Discount : -${productsInCart[index].discount}",softWrap: true,overflow: TextOverflow.clip,),

                                  ],
                                ),

                                SizedBox(width: 4,),
                                Text("Quantity : ${productsInCart[index].quantity}",softWrap: true,overflow: TextOverflow.clip,),
                                SizedBox(width: 4,),

                                ///  remove item from cart
                                IconButton(onPressed: () {
                                  removeFromCart("${productsInCart[index].id}");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyCartScreen(),));
                                }, icon: Icon(Icons.delete)),

                              ],
                            ),
                          ),
                        ),



                        ],
                    ),
                ),),
              ),

              productsInCart.length == 0 ? Container() : Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade200

                ),

                height: 200,
                width: double.infinity,
                child: Text("total price"),),

              /// Total price to pay

              /// order now
            ],
          ),
        ),
      ),
    );
  }


  void removeFromCart ( String productId ) async {
   // var prefs = await SharedPreferences.getInstance();
   // var  token = prefs.getString("loginKey");
var token =  ApiList.gettoken();
    try{
      final response = await http.delete(
        Uri.parse(ApiList.remove_From_Cart_Delete_Api),
          headers: {
            'Authorization': 'Bearer $token',            //user login token id
           // 'Content-Type': 'application/json', // Adjust content type if needed
          },
          body: {
            "key":productId,
          }
          );

      if(response.statusCode == 200){
        setState(() {

        });
      }

    }catch (e) {
      print(" error $e");
    }

  }
}
