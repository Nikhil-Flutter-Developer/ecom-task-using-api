

class Product {
  num? id;
  String? addedBy;
  num? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  num? brandId;
  String? unit;
  num? minQty;
  num? refundable;
  dynamic? digitalProductType;
  dynamic? digitalFileReady;
  List<String>? images;
  String? thumbnail;
  num? featured;
  dynamic? flashDeal;
  String? videoProvider;
  dynamic? videoUrl;
  List<Colors>? colors;
  num? variantProduct;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  List<Variation>? variation;
  num? published;
  num? unitPrice;
  num? purchasePrice;
  num? tax;
  String? taxType;
  num? discount;
  String? discountType;
  num? currentStock;
  num? minimumOrderQty;
  String? details;
  num? freeShipping;
  dynamic? attachment;
  String? createdAt;
  String? updatedAt;
  num? status;
  num? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  num? requestStatus;
  dynamic? deniedNote;
  num? shippingCost;
  num? multiplyQty;
  dynamic? tempShippingCost;
  dynamic? isShippingCostUpdated;
  String? code;
  num? reviewsCount;
  num? averageReview;
  List<dynamic>? reviews;
  List<dynamic>? translations;

  Product({
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
    required this.featured,
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
    required this.averageReview,
    required this.reviews,
    required this.translations,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var categoryList = json['category_ids'] as List;
    List<CategoryIds> categories =
    categoryList.map((i) => CategoryIds.fromJson(i)).toList();

    var colorList = json['colors'] as List;
    List<Colors> colors = colorList.map((i) => Colors.fromJson(i)).toList();

    var variationList = json['variation'] as List;
    List<Variation> variation =
    variationList.map((i) => Variation.fromJson(i)).toList();

    return Product(
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
      attributes: json['attributes'],
      choiceOptions: json['choice_options'],
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
      averageReview: json['average_review'],
      reviews: json['reviews'],
      translations: json['translations'],
    );
  }
}

class CategoryIds {
  String id;
  num position;

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

class Variation {
  String type;
  num price;
  String sku;
  num qty;

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
