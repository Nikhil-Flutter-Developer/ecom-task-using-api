import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseUrl {
  static String digital_product_url =     "https://www.infusevalue.live/storage/app/public/product/digital-product";
  static String brand_image_url =         "https://www.infusevalue.live/storage/app/public/brand";
  static String customer_image_url =      "https://www.infusevalue.live/storage/app/public/profile";
  static String banner_image_url =        "https://www.infusevalue.live/storage/app/public/banner";
  static String category_image_url =      "https://www.infusevalue.live/storage/app/public/category";
  static String review_image_url =        "https://www.infusevalue.live/storage/app/public";
  static String seller_image_url =        "https://www.infusevalue.live/storage/app/public/seller";
  static String shop_image_url  =         "https://www.infusevalue.live/storage/app/public/shop";
  static String notification_image_url =  "https://www.infusevalue.live/storage/app/public/notification";
  static String product_IMG_Url =         "https://www.infusevalue.live/storage/app/public/product/";
  static String thumbnail_Base_Url =      "https://www.infusevalue.live/storage/app/public/product/thumbnail/";

  static String contact_us =          "https://www.infusevalue.live/contacts";
  static String brands =              "https://www.infusevalue.live/brands";
  static String categories =          "https://www.infusevalue.live/categories";
  static String customer_account =    "https://www.infusevalue.live/user-account" ;

}

class ApiList {
  /// token
 static String _token = "" ;
 static String gettoken () { return _token ; }


 static settoken (value){ _token = value ;}

 static set_token ()async {
 var  prefs = await SharedPreferences.getInstance();
    _token =  prefs.getString("loginKey")!;
 }



/// get Apis
  static String cart_products_List_Get_Api = "https://www.infusevalue.live/api/v1/cart" ;
  static String dicounted_products_list_Get_Api = "https://www.infusevalue.live/api/v1/products/discounted-product" ;

  /// post Apis
 static String user_Register_Post_Api= "https://www.infusevalue.live/api/v1/auth/register";


 static String user_Login_Post_Api = "https://www.infusevalue.live/api/v1/auth/login";


 static String add_To_Cart_Post_Api = "https://www.infusevalue.live/api/v1/cart/add";
 static String Get_Wish_List_Get_Api = "https://www.infusevalue.live/api/v1/customer/wish-list" ;

 static String remove_From_Cart_Delete_Api =  "https://www.infusevalue.live/api/v1/cart/remove" ;

 static String remove_From_Wish_List_Delet_Api = "https://www.infusevalue.live/api/v1/customer/wish-list/remove";

 static String shiping_method_by_seller_Get_Api = "https://www.infusevalue.live/api/v1/shipping-method/by-seller/1/admin";


 final response = /*await*/ http.post(
  Uri.parse("$add_To_Cart_Post_Api"),        // post api link
  headers: {
  'Authorization': 'Bearer \$token',            //user login token id
  'Content-Type': 'application/json', // Adjust content type if needed
  },
   body: {
     "id":12,               // product id
     "quantity":1           // product quantity
   }
   );






}
      /// api lists ///


/// reg and login api


/// discounted product api

/// cart list
// https://www.infusevalue.live/api/v1/cart

/// add to cart api