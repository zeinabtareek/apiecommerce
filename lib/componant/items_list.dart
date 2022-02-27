import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';

import 'float_action_button.dart';

Widget ItemsList(BuildContext context){
  var size = MediaQuery.of(context).size;
  return GetBuilder<CartController>(
      init: CartController(),
      builder:(controller)=>ListView.builder(
          itemCount: controller.cartProductModel.length,
          shrinkWrap: true,
          itemBuilder: (context , index){
            return Container(
              padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
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
                children:  [
                  Image.network(controller.cartProductModel[index].image.toString(),
                    // placeholder: (context, url) => new CircularProgressIndicator(),
                    errorBuilder: (context, url, error) => new Icon(Icons.error),

                    width: size.width/4.5,
                    height: size.height/8,
                  ),
                  const SizedBox(width: 10,),
                  Flexible(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.cartProductModel[index].title.toString()),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.cartProductModel[index].price.toString(),
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff465bd8),
                                fontWeight: FontWeight.bold),
                          ),
                          FloatActionButton(
                            // backgroundColor: Color(0xff465bd8),
                            // onPressed: () {
                            //   // controller
                            //   //     .deleteItem(controller.items[index]);
                            // },
                            // child: const Icon(Icons.delete,
                            //   size: 20,
                            // ),
                            // mini: true,
                            // materialTapTargetSize:
                            // MaterialTapTargetSize.shrinkWrap,
                            // heroTag: null,
                          )
                        ],)
                    ],
                  ))

                ],
              ),
            );
          }
      )
  );
}
