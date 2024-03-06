// /*
//
// import 'package:flutter/material.dart';
//
// class DiscountedProduct {
//   int? totalSize;
//   int? limit;
//   int? offset;
//   List<Products>? products;
//
//   DiscountedProduct({this.totalSize, this.limit, this.offset, this.products});
//
//   DiscountedProduct.fromJson(Map<String, dynamic> json) {
//     totalSize = json['total_size'];
//     limit = json['limit'];
//     offset = json['offset'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         // Handle potential null values in the 'products' list
//         if (v != null) {
//           products!.add(Products.fromJson(v));
//         }
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_size'] = this.totalSize;
//     data['limit'] = this.limit;
//     data['offset'] = this.offset;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Products {
//   int? id;
//   String? addedBy;
//   int? userId;
//   String? name;
//   String? slug;
//   String? productType;
//   List<CategoryIds>? categoryIds;
//   int? brandId;
//   String? unit;
//   int? minQty;
//   int? refundable;
//   // Handle potential null values for these fields
//   dynamic? digitalProductType;
//   dynamic? digitalFileReady;
//   List<String>? images;
//   String? thumbnail;
//   int? featured;
//   dynamic? flashDeal;
//   String? videoProvider;
//   dynamic? videoUrl;
//   List<Colors>? colors;
//   int? variantProduct;
//   List<int>? attributes;
//   List<ChoiceOptions>? choiceOptions;
//   List<Variation>? variation;
//   int? published;
//   int? unitPrice;
//   double? purchasePrice;
//   int? tax;
//   String? taxType;
//   int? discount;
//   String? discountType;
//   int? currentStock;
//   int? minimumOrderQty;
//   String? details;
//   int? freeShipping;
//   dynamic? attachment;
//   String? createdAt;
//   String? updatedAt;
//   int? status;
//   int? featuredStatus;
//   String? metaTitle;
//   String? metaDescription;
//   String? metaImage;
//   int? requestStatus;
//   dynamic? deniedNote;
//   int? shippingCost;
//   int? multiplyQty;
//   dynamic? tempShippingCost;
//   dynamic? isShippingCostUpdated;
//   String? code;
//   int? reviewsCount;
//   // Handle potential null values for these lists
//   List<dynamic>? rating;
//   List<dynamic>? translations;
//   List<dynamic>? reviews;
//
//   Products(
//   {this.id,
//   this.addedBy,
//   this.userId,
//   this.name,
//   this.slug,
//   this.productType,
//   this.categoryIds,
//   this.brandId,
//   this.unit,
//   this.minQty,
//   this.refundable,
//   this.digitalProductType,
//   this.digitalFileReady,
//   this.images,
//   this.thumbnail,
//   this.featured,
//   this.flashDeal,
//   this.videoProvider,
//   this.videoUrl,
//   this.colors,
//   this.variantProduct,
//   this.attributes,
//   this.choiceOptions,
//   this.variation,
//   this.published,
//   this.unitPrice,
//   this.purchasePrice,
//   this.tax,
//   this.taxType,
//   this.discount,
//   this.discountType,
//   this.currentStock,
//   this.minimumOrderQty,
//     this.details,
//     this.freeShipping,
//     this.attachment,
//     this.createdAt,
//     this.updatedAt,
//     this.status,
//     this.featuredStatus,
//     this.metaTitle,
//     this.metaDescription,
//     this.metaImage,
//     this.requestStatus,
//     this.deniedNote,
//     this.shippingCost,
//     this.multiplyQty,
//     this.tempShippingCost,
//     this.isShippingCostUpdated,
//     this.code,
//     this.reviewsCount,
//     this.rating,
//     this.translations,
//     this.reviews});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     addedBy = json['added_by'];
//     userId = json['user_id'];
//     name = json['name'];
//     slug = json['slug'];
//     productType = json['product_type'];
//     if (json['category_ids'] != null) {
//       categoryIds = <CategoryIds>[];
//       json['category_ids'].forEach((v) {
//         categoryIds!.add(new CategoryIds.fromJson(v));
//       });
//     }
//     brandId = json['brand_id'];
//     unit = json['unit'];
//     minQty = json['min_qty'];
//     refundable = json['refundable'];
//     digitalProductType = json['digital_product_type'];
//     digitalFileReady = json['digital_file_ready'];
//     images = json['images'].cast<String>();
//     thumbnail = json['thumbnail'];
//     featured = json['featured'];
//     flashDeal = json['flash_deal'];
//     videoProvider = json['video_provider'];
//     videoUrl = json['video_url'];
//     if (json['colors'] != null) {
//       colors = <Colors>[];
//       json['colors'].forEach((v) {
//         colors!.add(new Colors.fromJson(v));
//       });
//     }
//     variantProduct = json['variant_product'];
//     attributes = json['attributes'].cast<int>();
//     if (json['choice_options'] != null) {
//       choiceOptions = <ChoiceOptions>[];
//       json['choice_options'].forEach((v) {
//         choiceOptions!.add(new ChoiceOptions.fromJson(v));
//       });
//     }
//     if (json['variation'] != null) {
//       variation = <Variation>[];
//       json['variation'].forEach((v) {
//         variation!.add(new Variation.fromJson(v));
//       });
//     }
//     published = json['published'];
//     unitPrice = json['unit_price'];
//     purchasePrice = json['purchase_price'];
//     tax = json['tax'];
//     taxType = json['tax_type'];
//     discount = json['discount'];
//     discountType = json['discount_type'];
//     currentStock = json['current_stock'];
//     minimumOrderQty = json['minimum_order_qty'];
//     details = json['details'];
//     freeShipping = json['free_shipping'];
//     attachment = json['attachment'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     status = json['status'];
//     featuredStatus = json['featured_status'];
//     metaTitle = json['meta_title'];
//     metaDescription = json['meta_description'];
//     metaImage = json['meta_image'];
//     requestStatus = json['request_status'];
//     deniedNote = json['denied_note'];
//     shippingCost = json['shipping_cost'];
//     multiplyQty = json['multiply_qty'];
//     tempShippingCost = json['temp_shipping_cost'];
//     isShippingCostUpdated = json['is_shipping_cost_updated'];
//     code = json['code'];
//     reviewsCount = json['reviews_count'];
//     rating = json['rating']?.cast<dynamic>(); // Handle potential null value
//     translations = json['translations']?.cast<dynamic>(); // Handle potential null value
//     reviews = json['reviews']?.cast<dynamic>(); // Handle potential null value
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['added_by'] = this.addedBy
//     data['added_by'] = this.addedBy;
//     data['user_id'] = this.userId;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['product_type'] = this.productType;
//     if (this.categoryIds != null) {
//       data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
//     }
//     data['brand_id'] = this.brandId;
//     data['unit'] = this.unit;
//     data['min_qty'] = this.minQty;
//     data['refundable'] = this.refundable;
//     data['digital_product_type'] = this.digitalProductType;
//     data['digital_file_ready'] = this.digitalFileReady;
//     data['images'] = this.images;
//     data['thumbnail'] = this.thumbnail;
//     data['featured'] = this.featured;
//     data['flash_deal'] = this.flashDeal;
//     data['video_provider'] = this.videoProvider;
//     data['video_url'] = this.videoUrl;
//     if (this.colors != null) {
//       data['colors'] = this.colors!.map((v) => v.toJson()).toList();
//     }
//     data['variant_product'] = this.variantProduct;
//     data['attributes'] = this.attributes;
//     if (this.choiceOptions != null) {
//       data['choice_options'] =
//           this.choiceOptions!.map((v) => v.toJson()).toList();
//     }
//     if (this.variation != null) {
//       data['variation'] = this.variation!.map((v) => v.toJson()).toList();
//     }
//     data['published'] = this.published;
//     data['unit_price'] = this.unitPrice;
//     data['purchase_price'] = this.purchasePrice;
//     data['tax'] = this.tax;
//     data['tax_type'] = this.taxType;
//     data['discount'] = this.discount;
//     data['discount_type'] = this.discountType;
//     data['current_stock'] = this.currentStock;
//     data['minimum_order_qty'] = this.minimumOrderQty;
//     data['details'] = this.details;
//     data['free_shipping'] = this.freeShipping;
//     data['attachment'] = this.attachment;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['status'] = this.status;
//     data['featured_status'] = this.featuredStatus;
//     data['meta_title'] = this.metaTitle;
//     data['meta_description'] = this.metaDescription;
//     data['meta_image'] = this.metaImage;
//     data['request_status'] = this.requestStatus;
//     data['denied_note'] = this.deniedNote;
//     data['shipping_cost'] = this.shippingCost;
//     data['multiply_qty'] = this.multiplyQty;
//     data['temp_shipping_cost'] = this.tempShippingCost;
//     data['is_shipping_cost_updated'] = this.isShippingCostUpdated;
//     data['code'] = this.code;
//     data['reviews_count'] = this.reviewsCount;
//     data['rating'] = this.rating;
//     data['translations'] = this.translations;
//     data['reviews'] = this.reviews;
//     return data;
//   }
// }
// */
