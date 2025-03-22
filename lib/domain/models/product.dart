import 'dart:convert';
import 'category.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product{
  int? id;
  String? name;
  double? price;
  String? description;
  int? categoryId;
  String? photo;
  Category? category;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryId,
    this.photo,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    categoryId: json["categoryId"],
    photo: json["photo"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "categoryId": categoryId,
    "photo": photo,
    "category": category?.toJson(),
  };

}


