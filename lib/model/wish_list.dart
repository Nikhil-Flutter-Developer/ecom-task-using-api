
class WishlistItem {
  final int id;
  final int customerId;
  final int productId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Product product;

  WishlistItem({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      productId: json['product_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class Product {
  final int id;
  final String slug;
  final int reviewsCount;
  final List<dynamic> translations;
  final List<dynamic> reviews;

  Product({
    required this.id,
    required this.slug,
    required this.reviewsCount,
    required this.translations,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      slug: json['slug'] as String,
      reviewsCount: json['reviews_count'] as int,
      translations: json['translations'] as List<dynamic>,
      reviews: json['reviews'] as List<dynamic>,
    );
  }
}
