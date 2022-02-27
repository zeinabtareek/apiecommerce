import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ItemModel {
  String? title;
  String? image;
  double ?price;
  int? id;
  String? description;
  String? category;
  int? quantity;
  double? rate;
  List<dynamic> ?articles =[].obs;

  ItemModel({
    this.quantity,
    this.title,
     this.price,
    this.image,
    this.category,
    this.description,
    this.id,
    this.rate,
    this.articles,
  });

    ItemModel.fromJson(Map<dynamic, dynamic> map){
      if (map == null) {
      return;
    }title = map['title'];
      image = map['image'];
      articles = map['articles'];
      category= map['category'];
      rate= map['rate'];
      id= map['id'];
      description= map['description'];
      quantity= map['quantity'];
      articles= map['articles'];
      price = map['price'].toDouble();

  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['title'] = title;
    map['quantity'] = quantity;
    map['price'] = price;
    map['rate'] = rate;
    map['image'] = image;
    map['id'] = id;
    map['category'] = category;
    map['description'] = description;
    return map;
  }
}
