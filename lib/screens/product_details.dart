import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/detail_of_pro.dart';

class ProductDetailsPage extends StatefulWidget {
  final productUrl;
  ProductDetailsPage({this.productUrl = "blaupunkt-em01-bll-wired-headset-5awPSS",});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

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
      appBar: AppBar(
        title: Text('Product Details'),
      ),
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
                  Center(child: Image.network("https://www.infusevalue.live/storage/app/public/product/thumbnail/${snapshot.data!.thumbnail}")),
                  SizedBox(height: 10.0),
                  Text(
                    'Price: \$${snapshot.data!.purchasePrice.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  /*Text(
                    'Details:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Image.network("https://www.infusevalue.live/storage/app/public/product/${snapshot.data!.metaImage}"),
               */ ],
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
}
