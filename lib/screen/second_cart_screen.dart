import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';
class CartPage extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: wItemList(context),
      ),
    );
  }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => controller.cartProductModel.length == 0
        ? Center(
      child: Text("Empty"),
    )
        : ListView.builder(
        itemCount: controller.cartProductModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding:
            EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xB0E7E9E7),
                    ],
                    begin: Alignment(0.2, 0.0),
                    end: Alignment(1.0, 0.0),
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Image.network(
                  controller.cartProductModel[index].image.toString(),
                  width: size.width / 4,
                  height: size.width / 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.cartProductModel[index].title.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.cartProductModel[index].price.toString() +
                                " \$",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff465bd8),
                                fontWeight: FontWeight.bold),
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xff465bd8),
                            onPressed: () {
                              // controller
                              //     .deleteItem(controller.cartProductModel[index]);
                            },
                            child: Icon(
                              Icons.star,
                              size: 20,
                            ),
                            mini: true,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            heroTag: null,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
