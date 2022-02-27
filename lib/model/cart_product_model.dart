import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CartProductModel {
  String ?title;
  String  ?image;
  double ?price;
  String ?productId;





  CartProductModel({
     this.title,
     this.price,
     this.image,
     this.productId,

  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) {
      return;
    }
    title = map['title'];
    image = map['image'];
   price = map['price'];
    productId = map['productId'];

  }

  toJson() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'productId': productId,
       };
  }


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['title'] = title;
    map['price'] = price;
    map['image'] = image;
    map['productId'] = productId;
    return map;
  }



}

