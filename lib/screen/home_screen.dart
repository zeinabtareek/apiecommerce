import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';
import 'package:hiveproject/controller/home_controller.dart';
import 'package:hiveproject/screen/product_page.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final CartController cc = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 20,
                children: [search(context),Categories(),wItemList(context)],
              ),
            )
          ],
        )
      )
    );
  }
  Widget search (BuildContext context){
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffBBDEFB), borderRadius: BorderRadius.circular(20)),
        child:IntrinsicHeight( // makes the  widgets all in the same size
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffE3F2FD)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10,left: 16,bottom: 10,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                    "Find the best\nproduct for you",
                    style: TextStyle(
                        color: Color(0xff465bd8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        width: double.infinity,
                        child: Wrap(
                          children: const [
                            Icon(Icons.search,
                              color: Color(0xff757575),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search what you need",
                              style: TextStyle(color: Color(0xff757575)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
        )
    );
  }
  Widget Categories (){
    return SizedBox(
      height: 40.0,
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),

          itemCount: controller.categoryItems.length,
        itemBuilder: (context, index){
        return   GestureDetector(
          child: Container(
            // height: 30,width: 30,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                Border.all(color: const Color(0xffBDBDBD), width: 0.4),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  controller.categoryItems[index].toString(),
                  style: const TextStyle(
                      fontSize: 15.0, color: Color(0xff616161)),
                ),
              ),
            ),
          ),
          onTap: () {

          },
        );
        }),
    );

  }
  Widget wItemList(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Center(
      child:
      Obx(()=>ListView.builder(
        itemCount: controller.itemItems.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
        return  GestureDetector(
          child: Container(
            height: size.height/7,
            width: size.width,
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 10),
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xB0E7E9E7),
                    ],
                    begin: Alignment(0.2, 0.0),
                    end: Alignment(1.0, 0.0),
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(20)),
            child:Row(
              children: [
                Image.network(controller.itemItems[index].image.toString(),
                width: size.width/4,
                height: size.height/4,),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child:Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children:  [
                       Text(controller.itemItems[index].title.toString(), style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox( height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                           Text("${controller.itemItems[index].price} \$",
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff465bd8),
                                fontWeight: FontWeight.bold),
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xff465bd8),
                            onPressed: () { },
                            child: const Icon(Icons.shopping_cart,
                              size: 18,
                            ),
                            mini: true,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            heroTag: null,
                          )
                        ],
                      )
                    ],
                  ) )
              ],
            ) ,
          ),onTap: () {
          Get.to(()=> ProductPage(
            description: controller.itemItems[index].description.toString(),
            category: controller.itemItems[index].category.toString(),
            title: controller.itemItems[index].title.toString(),
            price:controller.itemItems[index].price!,
            image: controller.itemItems[index].image.toString(),
            id: controller.itemItems[index].id!,
          ), arguments: [index]);
        },
        )  ;
      }),
    ));

  }
}
