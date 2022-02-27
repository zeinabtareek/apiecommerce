
import 'package:get/get.dart';
import 'package:hiveproject/controller/cart_controller.dart';
import 'package:hiveproject/controller/dashboard_controller.dart';
import 'package:hiveproject/controller/home_controller.dart';
import 'package:hiveproject/controller/splash_controller.dart';
import 'package:hiveproject/screen/home_screen.dart';

class Binding extends Bindings {
  @override
  void dependencies (){
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => SplashScreen());


  }
}