import 'dart:convert';

List<ProductResModel> productResModelFromJson(String str) => List<ProductResModel>.from(json.decode(str).map((x) => ProductResModel.fromJson(x)));


class ProductResModel {
    int? id;
    List<Variation>? variations;
    bool? inWishlist;
    int? avgRating;
    List<String>? images;
    bool? variationExists;
    int? salePrice;
    List<Addon>? addons;
    bool? available;
    String? availableFrom;
    String? availableTo;
    String? name;
    String? description;
    String? caption;
    String? featuredImage;
    int? mrp;
    int? stock;
    bool? isActive;
    String? discount;
    DateTime? createdDate;
    String? productType;
    dynamic showingOrder;
    String? variationName;
    int? category;
    int? taxRate;

    ProductResModel({
        this.id,
        this.variations,
        this.inWishlist,
        this.avgRating,
        this.images,
        this.variationExists,
        this.salePrice,
        this.addons,
        this.available,
        this.availableFrom,
        this.availableTo,
        this.name,
        this.description,
        this.caption,
        this.featuredImage,
        this.mrp,
        this.stock,
        this.isActive,
        this.discount,
        this.createdDate,
        this.productType,
        this.showingOrder,
        this.variationName,
        this.category,
        this.taxRate,
    });

    factory ProductResModel.fromJson(Map<String, dynamic> json) => ProductResModel(
        id: json["id"],
        variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        variationExists: json["variation_exists"],
        salePrice: json["sale_price"],
        addons: json["addons"] == null ? [] : List<Addon>.from(json["addons"]!.map((x) => Addon.fromJson(x))),
        available: json["available"],
        availableFrom: json["available_from"],
        availableTo: json["available_to"],
        name: json["name"],
        description: json["description"],
        caption: json["caption"],
        featuredImage: json["featured_image"],
        mrp: json["mrp"],
        stock: json["stock"],
        isActive: json["is_active"],
        discount: json["discount"],
        createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
        productType: json["product_type"],
        showingOrder: json["showing_order"],
        variationName: json["variation_name"],
        category: json["category"],
        taxRate: json["tax_rate"],
    );

  
}

class Addon {
    int? id;
    int? price;
    String? name;
    String? description;
    String? featuredImage;
    int? stock;
    bool? isActive;
    int? taxRate;

    Addon({
        this.id,
        this.price,
        this.name,
        this.description,
        this.featuredImage,
        this.stock,
        this.isActive,
        this.taxRate,
    });

    factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        description: json["description"],
        featuredImage: json["featured_image"],
        stock: json["stock"],
        isActive: json["is_active"],
        taxRate: json["tax_rate"],
    );


}

class Variation {
    int? id;
    int? salePrice;
    String? variationName;
    String? featuredImage;
    int? stock;
    DateTime? created;
    bool? showStatus;
    int? showingOrder;
    int? product;

    Variation({
        this.id,
        this.salePrice,
        this.variationName,
        this.featuredImage,
        this.stock,
        this.created,
        this.showStatus,
        this.showingOrder,
        this.product,
    });

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        salePrice: json["sale_price"],
        variationName: json["variation_name"],
        featuredImage: json["featured_image"],
        stock: json["stock"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        showStatus: json["show_status"],
        showingOrder: json["showing_order"],
        product: json["product"],
    );


}
