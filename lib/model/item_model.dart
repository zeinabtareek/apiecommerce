// import 'package:hive_flutter/adapters.dart';
//
// @HiveType(typeId: 1)
// class ItemModel extends HiveObject{
//   @HiveField(0)
//   int ?id;
//   @HiveField(1)
//   String ?title;
//   @HiveField(2)
//   String ?price;
//   @HiveField(3)
//   String? description;
//   @HiveField(4)
//   String ?category;
//   @HiveField(5)
//   String ?image;
//   @HiveField(6)
//   int ?quantity;
//   @HiveField(7)
//   String? productId;
//   // Rating ?rating;
//
//   ItemModel(
//       { this.id,
//          this.title,
//         this.price,
//          this.description,
//          this.category,
//          this.image,
//         this.productId,
//          this.quantity});
//
//   ItemModel.fromJson(Map<String, dynamic> json) {
//     if (json == null) {
//       return;
//     }
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     productId = json['productId'];
//     category = json['category'];
//     quantity = json['quantity'];
//     image = json['image'];
//     // rating = (json['rating'] != null ? new Rating.fromJson(json['rating']) : null);
//
//
//   }
// Map<String, dynamic> toMap() {
//   var map = <String, dynamic>{};
//   map['title'] = title;
//   map['quantity'] = quantity;
//   map['price'] = price;
//   map['image'] = image;
//   map['description'] = description;
//   map['productId'] = productId;
//   return map;
// }
//
// //
// // @HiveType(typeId: 2)
// // class Rating extends HiveObject{
// //   dynamic ?rate;
// //   int? count;
// //
// //   Rating({ this.rate,   this.count});
// //
// //   Rating.fromJson(Map<String, dynamic> json) {
// //     rate = json['rate'];
// //     count = json['count'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['rate'] = this.rate;
// //     data['count'] = this.count;
// //     return data;
// //   }
// }
