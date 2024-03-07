import 'dart:convert';
import 'package:ecom/api_helper/api_helper.dart';
import 'package:ecom/screens/auth/login.dart';
import 'package:ecom/screens/cart_screen.dart';
import 'package:ecom/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductItem>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
    getToken();
  }

  void getToken () async {
  var  prefs = await SharedPreferences.getInstance();
    var  token = prefs.getString("loginKey");
    print("token :: $token ::");
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
           
           /// go to cart
           IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartScreen(),));
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
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16), bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),topLeft:Radius.circular(4) ),
                                      color: Colors.blue
                                  ),
                                  child: Icon(Icons.favorite_border,color: Colors.white,)),
                            ),),


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
               /// this

            /*return InkWell(
             onTap: (){
             var productSlug = products[index].slug;
             print(productSlug);
               goToDetailsPage(productSlug);
             },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                color: Colors.red.shade400
              ),
              //height: 100,

                child: Stack(

              children: [


                /// thumb
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("https://www.infusevalue.live/storage/app/public/product/thumbnail/${products[index].thumbnail}",
                      width: 150,height: 150,fit: BoxFit.fitHeight,),
                  )),


                /// whislist button
                Positioned(
                    top: 0,
               //   bottom: 0,
                 // left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16), bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),topLeft:Radius.circular(4) ),
                        color: Colors.blue
                        ),
                        child: Icon(Icons.favorite_border,color: Colors.white,)),
                  ),),


              /// product name
                Positioned(
                //  top: 0,
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(products[index].name,softWrap: false,),
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
                          style: TextStyle(fontWeight: FontWeight.w500),),

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


              ],),
              ),
            );*/


            },)

             /* ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5,),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.red.shade200
                    ),
                    //height: 100,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.blue.shade200
                        ),
                          height: 200,
                          width: 200,
                          child: Image.network("https://www.infusevalue.live/storage/app/public/product/thumbnail/${products[index].thumbnail}",fit: BoxFit.fitHeight,)),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Container(
                                width: 200,
                                child: Text(products[index].name,softWrap: false,)),
                          SizedBox(height: 10,),
                          Text('Price: \$${products[index].unitPrice.toString()}'),
                        ],
                      ),

                    ],),
                  );
                },
              ),*/
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
 void logout ()async{
 var prefs = await SharedPreferences.getInstance();
 await prefs.setString("loginKey", "");
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLoginScreen(),));
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

