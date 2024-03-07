import 'package:ecom/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../api_helper/api_helper.dart';
import '../custom_widgets/custom_widget.dart';
import '../model/detail_of_pro.dart';

class ProductDetailsPage extends StatefulWidget {
  final productUrl;
  ProductDetailsPage({this.productUrl = "blaupunkt-em01-bll-wired-headset-5awPSS",});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int productQnty = 1 ;
  late Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  Future<Product> fetchProduct() async {

    final response = await http.get(Uri.parse('https://www.infusevalue.live/api/v1/products/details/${widget.productUrl}'));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
    //  backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: FutureBuilder<Product>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      snapshot.data!.name!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                //  Center(child: Image.network("${BaseUrl.thumbnail_Base_Url}${snapshot.data!.thumbnail}")),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.images!.length,
                      itemBuilder: (context, index) {

                        return Container(
                          height: 300,
                          child: Image.network("${BaseUrl.product_IMG_Url}${snapshot.data!.images![index]}"),
                        );
                      },),
                  ),

                  SizedBox(height: 10.0),
                  Text(
                    'Price: \$${snapshot.data!.purchasePrice.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Product id : ${snapshot.data!.id.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      CustomElevatedButton(onPressed: (){
                        var  productId = "${snapshot.data!.id!}" ;

                        addToCart ( productId ,productQnty.toString());
                      },buttonText: "Add to cart",),

                      Spacer(),
                      Container(
                        width: 120,
                        height: 50,
                        child: Stack(children: [
                          Positioned(
                            bottom: 0,
                            top: 0,
                            left: 4,
                            child: InkWell(
                              onTap: () {
                                if(productQnty < 5 ){setState(() {
                                  productQnty +=  1 ;
                                });}
                              },
                              child: CircleAvatar(
                                maxRadius: 16,
                                child: Icon(Icons.add),

                              ),
                            ),
                          ),

                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(child: Text("$productQnty",style: TextStyle(fontSize: 16),))
                          ),

                          Positioned(
                            bottom: 0,
                            top: 0,
                            right: 4,
                            child: InkWell(
                              onTap: () {
                                if(productQnty > 1 ){setState(() {
                                  productQnty -=  1 ;
                                });}

                              },
                              child: CircleAvatar(
                                maxRadius: 16,
                                child: Icon(Icons.remove),

                              ),
                            ),
                          ),

                        ]),
                      ),




                      Spacer(),

                      CustomElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartScreen(),));},
                          buttonText: "Go to cart"),
                    ],
                  ),




                ],
              ),
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

  void addToCart ( String productId ,String productQnty) async {
    var prefs = await SharedPreferences.getInstance();
    var  token = prefs.getString("loginKey");

    try{
      final response = await http.post(
          Uri.parse(ApiList.add_To_Cart_Post_Api),
          headers: {
            'Authorization': 'Bearer $token',            //user login token id
           // 'Content-Type': 'application/json', // Adjust content type if needed
          },
          body: {
            "id": productId,               // product id
            "quantity": productQnty,           // product quantity
          }
      );

      if(response.statusCode == 200){
        print("product added to Cart :: ${response.body}");
        setState(() {

        });
      }
    }catch (e) {
      print(" error $e");
    }
  }
}


