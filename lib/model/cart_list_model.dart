class CartProduct {
  final int id;
  final int customerId;
  final String cartGroupId;
  final int productId;
  final String productType;
  final String? digitalProductType;
  final String? color;
  final Choices choices;
  final Variations variations;
  final String variant;
  final int quantity;
  final double price;
  final double tax;
  final double discount;
  final String slug;
  final String name;
  final String thumbnail;
  final int sellerId;
  final String sellerIs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String shopInfo;
  final double shippingCost;
  final String shippingType;
  final Product product;

  CartProduct({
    required this.id,
    required this.customerId,
    required this.cartGroupId,
    required this.productId,
    required this.productType,
    this.digitalProductType,
    this.color,
    required this.choices,
    required this.variations,
    required this.variant,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.discount,
    required this.slug,
    required this.name,
    required this.thumbnail,
    required this.sellerId,
    required this.sellerIs,
    required this.createdAt,
    required this.updatedAt,
    required this.shopInfo,
    required this.shippingCost,
    required this.shippingType,
    required this.product,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      customerId: json['customer_id'],
      cartGroupId: json['cart_group_id'],
      productId: json['product_id'],
      productType: json['product_type'],
      digitalProductType: json['digital_product_type'],
      color: json['color'],
      choices: Choices.fromJson(json['choices']),
      variations: Variations.fromJson(json['variations']),
      variant: json['variant'],
      quantity: json['quantity'],
      price: json['price'],
      tax: json['tax'],
      discount: json['discount'],
      slug: json['slug'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      sellerId: json['seller_id'],
      sellerIs: json['seller_is'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      shopInfo: json['shop_info'],
      shippingCost: json['shipping_cost'],
      shippingType: json['shipping_type'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Choices {
  final String? choice2;

  Choices({this.choice2});

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      choice2: json['choice_2'],
    );
  }
}

class Variations {
  final String? size;

  Variations({this.size});

  factory Variations.fromJson(Map<String, dynamic> json) {
    return Variations(
      size: json['size'],
    );
  }
}

class Product {
  final int id;
  final String name;
  final String slug;
  final int currentStock;
  final int minimumOrderQty;
  final int reviewsCount;
  final int totalCurrentStock;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.reviewsCount,
    required this.totalCurrentStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      currentStock: json['current_stock'],
      minimumOrderQty: json['minimum_order_qty'],
      reviewsCount: json['reviews_count'],
      totalCurrentStock: json['total_current_stock'],
    );
  }
}
