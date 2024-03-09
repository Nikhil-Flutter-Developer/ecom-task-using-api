import 'dart:convert';
import 'package:ecom/api_helper/api_helper.dart';
import 'package:ecom/provider/auth_provider.dart';
import 'package:ecom/routes/named_routes.dart';
import 'package:ecom/screens/auth/login.dart';
import 'package:ecom/screens/cart_screen.dart';
import 'package:ecom/screens/product_details.dart';
import 'package:ecom/screens/wish_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductItem>> futureProducts;
  void callFunction () async {
    await ApiList.set_token() ;
  }
  @override
  void initState() {
    super.initState();
    callFunction();
    futureProducts = fetchProducts();

  }

  Future<List<ProductItem>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://www.infusevalue.live/api/v1/products/discounted-product'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['products'];
      return jsonResponse.map((data) => ProductItem.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void goToDetailsPage(productUrl){

    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(productUrl: productUrl),));

  }

  @override
  Widget build(BuildContext context) {
    print("api list token value at home page is :: ${ApiList.gettoken()} ::");
   var authProvider = Provider.of<Auth_Provider>(context);


    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        leading: IconButton(onPressed: (){
          logout();
        },icon: Icon(Icons.logout)),

        title: Text('Product List'),
         centerTitle: true,
         actions: [

           /// go to wishlist
           IconButton(onPressed: (){
         //    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWishListScreen(),));
            Navigator.pushNamed(context, MyNamedRoutes.wishListScreen);
             }, icon: Icon(Icons.favorite)),


           /// go to cart
           IconButton(onPressed: (){
       //      Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartScreen(),));
          Navigator.pushNamed(context, MyNamedRoutes.cartScreen);

           }, icon: Icon(Icons.shopping_bag))
         ],

      ),
      body: FutureBuilder<List<ProductItem>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductItem> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:  12.0,vertical: 5),
              child:

              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: 15,
                itemBuilder: (context, index) {

          /// this
                  return InkWell(
                    onLongPress: (){
                      addToWishList("${products![index].id}",ApiList.gettoken(),);
                      },
                    onTap: (){
                      var productSlug = products[index].slug;
                      print(productSlug);
                      goToDetailsPage(productSlug);
                    },
                    child: Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(10),

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(18),
                            border:  Border.all(
                                color: Colors.red.shade400,
                                width: 3),
                            // color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage("${BaseUrl.thumbnail_Base_Url}${products[index].thumbnail}"),

                                fit: BoxFit.cover,
                            )
                        ),
                        child: Stack(children: [

                          /// fav Icon
                          Positioned(
                            top: 0,
                            //   bottom: 0,
                            // left: 0,
                            right: 0,
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16), bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4),topLeft:Radius.circular(4) ),
                                    color: Colors.blue
                                ),
                                child: Icon(Icons.favorite_border,color: Colors.white,)),),


                          /// linearGradient

                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16) ,
                                gradient: LinearGradient(

                                  begin: Alignment.bottomCenter, // Alignment for start of the gradient
                                  end: Alignment.center, // Alignment for end of the gradient
                                  colors: [Colors.black87, Colors.transparent ], // Dark colors
                                ),)

                          ),

                          /// product name
                          Positioned(
                            //  top: 0,
                            bottom: 32,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(products[index].name,softWrap: false,style: TextStyle(color: Colors.white),overflow: TextOverflow.fade),
                            ),),

                          /// product price

                          Positioned(
                            //top: 0,
                            bottom: 4,
                            left: 0,
                            right: 0,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text('\$${products[index].purchase_price.toString()}',
                                    style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),

                                  Spacer(),

                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(maxRadius: 8,backgroundColor: Colors.white,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(maxRadius: 8,backgroundColor: Colors.purple,),
                                  ), Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(maxRadius: 8,backgroundColor: Colors.pink.shade700,),
                                  ),
                                ],
                              ),
                            ),),

                        ])

                    ),
                  );

            },)


            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
  void addToWishList (productId , userToken) async {
    if(productId != null && userToken !=  null ) {
      var uri = Uri.parse(
          "https://www.infusevalue.live/api/v1/customer/wish-list/add");

   var response  =  await http.post(uri, body: {
        "product_id": productId
      },
          headers: {
            'Authorization': 'Bearer $userToken',
            //  'Content-Type': 'application/json',
          }
      );
      var data =  jsonDecode(response.body.toString());
   if(response.statusCode == 200 ){
     // print("product added to wish list");
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Center(child: Text("product ${data["message"]} added to wish list"))));
   } else {
     print(response.body);
     print("product not added to wish list");
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Center(child: Text("product ${data["message"]} added to wish list"))));

   }

    }
  }

 void logout ()async{
 var prefs = await SharedPreferences.getInstance();
 await prefs.setString("loginKey", "");

  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLoginScreen(),));
  Navigator.pushReplacementNamed(context, MyNamedRoutes.loginScreen);
 }
}

class ProductItem {
  final int id;
  final String name;
  final String slug;
  final String thumbnail;
  final num purchase_price;
  final int unitPrice;

  ProductItem({
    required this.purchase_price,
    required this.slug,
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.unitPrice,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      purchase_price: json["purchase_price"],
      slug: json["slug"],
      id: json['id'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      unitPrice: json['unit_price'],
    );
  }
}

