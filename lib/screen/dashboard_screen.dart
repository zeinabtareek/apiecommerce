import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';
import 'package:hiveproject/controller/dashboard_controller.dart';
import 'package:hiveproject/controller/home_controller.dart';
import 'package:hiveproject/screen/cart_screen.dart';
import 'package:hiveproject/screen/home_screen.dart';
import 'package:hiveproject/screen/second_cart_screen.dart';

class DashboardScreen extends StatelessWidget {
DashboardController controller =Get.put(DashboardController());
final HomeController hc = Get.put(HomeController());
final CartController cc = Get.put(CartController());

  @override
  Widget build(BuildContext context) {


    return Obx(()=>Scaffold(
      body: IndexedStack(
        index: controller.index.value,
        children: [
          HomeScreen(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff465bd8),
        items: bottomItems(),
        onTap: controller.onChange,
        currentIndex: controller.index.value,
      ),
      ),
    );
  }
List<BottomNavigationBarItem> bottomItems(){
  return [
    const BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart) , label: "Cart"),
  ];
}
}
