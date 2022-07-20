// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  num? ID;
  String? photo;
  String? name;
  String? category;
  num? price;
  num? discount;
  num? amount;
  ProductModel({
    this.ID,
    this.photo,
    this.name,
    this.category,
    this.price,
    this.discount,
    this.amount,
  });

  ProductModel copyWith({
    num? ID,
    String? photo,
    String? name,
    String? category,
    num? price,
    num? discount,
    num? amount,
  }) {
    return ProductModel(
      ID: ID ?? this.ID,
      photo: photo ?? this.photo,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': ID,
      'photo': photo,
      'name': name,
      'category': category,
      'price': price,
      'discount': discount,
      'amount': amount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      ID: map['ID'] != null ? map['ID'] as num : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      discount: map['discount'] != null ? map['discount'] as num : null,
      amount: map['amount'] != null ? map['amount'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(ID: $ID, photo: $photo, name: $name, category: $category, price: $price, discount: $discount, amount: $amount)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.ID == ID &&
        other.photo == photo &&
        other.name == name &&
        other.category == category &&
        other.price == price &&
        other.discount == discount &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        photo.hashCode ^
        name.hashCode ^
        category.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        amount.hashCode;
  }
}
