
class Product {
  int totalSize;
  int limit;
  int offset;
  List<ProductItem> products;

  Product({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.products,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<ProductItem> products =
    productList.map((i) => ProductItem.fromJson(i)).toList();

    return Product(
      totalSize: json['total_size'],
      limit: json['limit'],
      offset: json['offset'],
      products: products,
    );
  }
}

class ProductItem {
  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  String productType;
  List<CategoryIds> categoryIds;
  int brandId;
  String unit;
  int minQty;
  int refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  List<String> images;
  String thumbnail;
  int? featured;
  dynamic flashDeal;
  String videoProvider;
  dynamic videoUrl;
  List<Colors> colors;
  int variantProduct;
  List<int> attributes;
  List<ChoiceOptions> choiceOptions;
  List<Variation> variation;
  int published;
  int unitPrice;
  int purchasePrice;
  int tax;
  String taxType;
  int discount;
  String discountType;
  int currentStock;
  int minimumOrderQty;
  String details;
  int freeShipping;
  dynamic attachment;
  String createdAt;
  String updatedAt;
  int status;
  int featuredStatus;
  String metaTitle;
  String metaDescription;
  String metaImage;
  int requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String code;
  int reviewsCount;
  List<dynamic> rating;
  List<dynamic> translations;
  List<dynamic> reviews;

  ProductItem({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.productType,
    required this.categoryIds,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.digitalProductType,
    required this.digitalFileReady,
    required this.images,
    required this.thumbnail,
    this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.details,
    required this.freeShipping,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
    required this.code,
    required this.reviewsCount,
    required this.rating,
    required this.translations,
    required this.reviews,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    var categoryList = json['category_ids'] as List;
    List<CategoryIds> categories =
    categoryList.map((i) => CategoryIds.fromJson(i)).toList();

    var colorList = json['colors'] as List;
    List<Colors> colors = colorList.map((i) => Colors.fromJson(i)).toList();

    var choiceList = json['choice_options'] as List;
    List<ChoiceOptions> choiceOptions =
    choiceList.map((i) => ChoiceOptions.fromJson(i)).toList();

    var variationList = json['variation'] as List;
    List<Variation> variation =
    variationList.map((i) => Variation.fromJson(i)).toList();

    return ProductItem(
      id: json['id'],
      addedBy: json['added_by'],
      userId: json['user_id'],
      name: json['name'],
      slug: json['slug'],
      productType: json['product_type'],
      categoryIds: categories,
      brandId: json['brand_id'],
      unit: json['unit'],
      minQty: json['min_qty'],
      refundable: json['refundable'],
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'],
      videoUrl: json['video_url'],
      colors: colors,
      variantProduct: json['variant_product'],
      attributes: List<int>.from(json['attributes']),
      choiceOptions: choiceOptions,
      variation: variation,
      published: json['published'],
      unitPrice: json['unit_price'],
      purchasePrice: json['purchase_price'],
      tax: json['tax'],
      taxType: json['tax_type'],
      discount: json['discount'],
      discountType: json['discount_type'],
      currentStock: json['current_stock'],
      minimumOrderQty: json['minimum_order_qty'],
      details: json['details'],
      freeShipping: json['free_shipping'],
      attachment: json['attachment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      featuredStatus: json['featured_status'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'],
      requestStatus: json['request_status'],
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'],
      multiplyQty: json['multiply_qty'],
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'],
      reviewsCount: json['reviews_count'],
      rating: List<dynamic>.from(json['rating']),
      translations: List<dynamic>.from(json['translations']),
      reviews: List<dynamic>.from(json['reviews']),
    );
  }
}

class CategoryIds {
  String id;
  int position;

  CategoryIds({
    required this.id,
    required this.position,
  });

  factory CategoryIds.fromJson(Map<String, dynamic> json) {
    return CategoryIds(
      id: json['id'],
      position: json['position'],
    );
  }
}

class Colors {
  String name;
  String code;

  Colors({
    required this.name,
    required this.code,
  });

  factory Colors.fromJson(Map<String, dynamic> json) {
    return Colors(
      name: json['name'],
      code: json['code'],
    );
  }
}

class ChoiceOptions {
  String name;
  String title;
  List<String> options;

  ChoiceOptions({
  required this.name,
  required this.title,
    required this.options,
  });

  factory ChoiceOptions.fromJson(Map<String, dynamic> json) {
    return ChoiceOptions(
      name: json['name'],
      title: json['title'],
      options: List<String>.from(json['options']),
    );
  }
}

class Variation {
  String type;
  int price;
  String sku;
  int qty;

  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      type: json['type'],
      price: json['price'],
      sku: json['sku'],
      qty: json['qty'],
    );
  }
}



/// model is created for this coming data


/*


{
"total_size": 23,
"limit": 0,
"offset": 0,
"products": [


{
"id": 11,
"added_by": "admin",
"user_id": 1,
"name": "Women Red, Black Flats Sandal",
"slug": "women-red-black-flats-sandal-uyHsiz",
"product_type": "physical",
"category_ids": [
{
"id": "1",
"position": 1
},
{
"id": "10",
"position": 2
},
{
"id": "34",
"position": 3
}
],
"brand_id": 6,
"unit": "pc",
"min_qty": 1,
"refundable": 1,
"digital_product_type": null,
"digital_file_ready": null,
"images": [
"2023-09-23-650ee464e2666.png"
],
"thumbnail": "2023-09-23-650ee464e5930.png",
"featured": 1,
"flash_deal": null,
"video_provider": "youtube",
"video_url": null,
"colors": [
{
"name": "Brown",
"code": "#A52A2A"
}
],
"variant_product": 0,
"attributes": [
2
],
"choice_options": [
{
"name": "choice_2",
"title": "size",
"options": [
"9"
]
}
],
"variation": [
{
"type": "Brown-9",
"price": 800,
"sku": "WRBFS-Brown-9",
"qty": 12
}
],
"published": 0,
"unit_price": 800,
"purchase_price": 300,
"tax": 2,
"tax_type": "percent",
"discount": 32,
"discount_type": "percent",
"current_stock": 500,
"minimum_order_qty": 1,
"details": "<p>Women Red, Black Flats Sandal</p>",
"free_shipping": 0,
"attachment": null,
"created_at": "2023-09-23T13:13:08.000000Z",
"updated_at": "2023-09-23T14:00:01.000000Z",
"status": 1,
"featured_status": 1,
"meta_title": "Women Red, Black Flats Sandal",
"meta_description": "Type\r\nFlats\r\nLeather Type\r\nNubuck\r\nUpper Pattern\r\nSolid\r\nType for Flats\r\nEthnic Sandal(Chappal)\r\nColor\r\nRed, Black\r\nTanning Process\r\nSynthetic\r\nRemovable Insole\r\nNo\r\nPack of\r\n1",
"meta_image": "2023-09-23-650ee464e61d0.png",
"request_status": 1,
"denied_note": null,
"shipping_cost": 0,
"multiply_qty": 0,
"temp_shipping_cost": null,
"is_shipping_cost_updated": null,
"code": "106261",
"reviews_count": 0,
"rating": [],
"translations": [],
"reviews": []
},
{
"id": 10,
"added_by": "admin",
"user_id": 1,
"name": "Casual Puff Sleeves Solid Women Blue Top",
"slug": "casual-puff-sleeves-solid-women-blue-top-DOZfr6",
"product_type": "physical",
"category_ids": [
{
"id": "1",
"position": 1
},
{
"id": "9",
"position": 2
},
{
"id": "31",
"position": 3
}
],
"brand_id": 5,
"unit": "pc",
"min_qty": 1,
"refundable": 1,
"digital_product_type": null,
"digital_file_ready": null,
"images": [
"2023-09-23-650ee39b2cca1.png"
],
"thumbnail": "2023-09-23-650ee39b300c9.png",
"featured": null,
"flash_deal": null,
"video_provider": "youtube",
"video_url": null,
"colors": [
{
"name": "Aqua",
"code": "#00FFFF"
}
],
"variant_product": 0,
"attributes": [
2
],
"choice_options": [
{
"name": "choice_2",
"title": "size",
"options": [
"34"
]
}
],
"variation": [
{
"type": "Aqua-34",
"price": 676,
"sku": "CPSSWBT-Aqua-34",
"qty": 12
}
],
"published": 0,
"unit_price": 676,
"purchase_price": 43,
"tax": 2,
"tax_type": "percent",
"discount": 34,
"discount_type": "percent",
"current_stock": 500,
"minimum_order_qty": 2,
"details": "<p>Casual Puff Sleeves Solid Women Blue Top</p>",
"free_shipping": 0,
"attachment": null,
"created_at": "2023-09-23T13:09:47.000000Z",
"updated_at": "2023-09-23T13:09:47.000000Z",
"status": 1,
"featured_status": 1,
"meta_title": "Casual Puff Sleeves Solid Women Blue Top",
"meta_description": "Neck\r\nRound Neck\r\nSleeve Style\r\nPuff Sleeves\r\nSleeve Length\r\nHalf Sleeve\r\nFit\r\nSlim\r\nFabric\r\nPolyester\r\nType\r\nRegular Top\r\nBelt Included\r\nNo\r\nPattern\r\nSolid",
"meta_image": "2023-09-23-650ee39b3094b.png",
"request_status": 1,
"denied_note": null,
"shipping_cost": 0,
"multiply_qty": 0,
"temp_shipping_cost": null,
"is_shipping_cost_updated": null,
"code": "125775",
"reviews_count": 0,
"rating": [],
"translations": [],
"reviews": []
},
{
"id": 9,
"added_by": "admin",
"user_id": 1,
"name": "Women Fit and Flare Pink, Grey, Red Dress",
"slug": "women-fit-and-flare-pink-grey-red-dress-kUaSLl",
"product_type": "physical",
"category_ids": [
{
"id": "1",
"position": 1
},
{
"id": "9",
"position": 2
},
{
"id": "30",
"position": 3
}
],
"brand_id": 5,
"unit": "pc",
"min_qty": 1,
"refundable": 1,
"digital_product_type": null,
"digital_file_ready": null,
"images": [
"2023-09-23-650ee2ea376d7.png"
],
"thumbnail": "2023-09-23-650ee2ea3a815.png",
"featured": 1,
"flash_deal": null,
"video_provider": "youtube",
"video_url": null,
"colors": [
{
"name": "Aquamarine",
"code": "#7FFFD4"
}
],
"variant_product": 0,
"attributes": [
2
],
"choice_options": [
{
"name": "choice_2",
"title": "size",
"options": [
"23"
]
}
],
"variation": [
{
"type": "Aquamarine-23",
"price": 999,
"sku": "WFaFPGRD-Aquamarine-23",
"qty": 12
}
],
"published": 0,
"unit_price": 999,
"purchase_price": 500,
"tax": 2,
"tax_type": "percent",
"discount": 34,
"discount_type": "percent",
"current_stock": 500,
"minimum_order_qty": 5,
"details": "<p>Women Fit and Flare Pink, Grey, Red Dress</p>",
"free_shipping": 0,
"attachment": null,
"created_at": "2023-09-23T13:06:50.000000Z",
"updated_at": "2023-09-23T14:00:04.000000Z",
"status": 1,
"featured_status": 1,
"meta_title": "Women Fit and Flare Pink, Grey, Red Dress",
"meta_description": "Color\r\nPink, Grey, Red\r\nLength\r\nMidi/Calf Length\r\nFabric\r\nGeorgette\r\nPattern\r\nPrinted\r\nIdeal For\r\nWomen\r\nType\r\nFit and Flare\r\nStyle Code\r\nFlower_Gown\r\nSuitable For\r\nWestern Wear",
"meta_image": "2023-09-23-650ee2ea3b15a.png",
"request_status": 1,
"denied_note": null,
"shipping_cost": 0,
"multiply_qty": 0,
"temp_shipping_cost": null,
"is_shipping_cost_updated": null,
"code": "160794",
"reviews_count": 0,
"rating": [],
"translations": [],
"reviews": []
}
]
}
*/
