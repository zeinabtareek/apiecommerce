import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';
import 'package:hiveproject/model/cart_product_model.dart';
import 'package:hiveproject/model/item2.dart';
import 'package:hiveproject/model/item_model.dart';

class ProductPage extends StatelessWidget {
  ProductPage({
    required this.description ,
    required this.title,
    required this.image,
    required this.category,
    required this.price,
    required this.id,
  });
  ItemModel itemModel=ItemModel();
  String description;
  String title;
  String image;
  int id;
  String category;
  double price;
  @override
  Widget build(BuildContext context) {
    CartController controller =Get.put(CartController());
    return Scaffold(
        backgroundColor: const Color(0xff465bd8),
        appBar: AppBar(
          title: Text(category),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Color(0xff465bd8),
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "\$ $price"  ,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22.0),
              ),
              GetBuilder<CartController>(
                init: CartController(),
                builder: (controller)=>TextButton(
                  onPressed: () {
                    controller.addToCart(CartProductModel(
                      title: title.toString(),
                      image: image.toString(),
                      price: price,
                      productId: id.toString(),
                    )
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.shopping_bag,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    overlayColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),

        body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image,width: MediaQuery.of(context).size.width,fit: BoxFit.contain,),
              const SizedBox(
                height: 20,
              ),
              Align(alignment: Alignment.centerLeft,child: Text(category)),
              const SizedBox(
                height: 10,
              ),
               Text(title,
                style:
                TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.star,
                    color: Colors.amber,
                  ),
                  Text('3.5'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
                       Text(description,style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ),
      )
    );
  }
}
