import 'package:get/get.dart';
import 'package:hiveproject/screen/dashboard_screen.dart';

class SplashScreen extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    goToNextPage();
  }

  void goToNextPage()async{
    await Future.delayed(Duration (seconds: 2));
    Get.off(DashboardScreen());
  }
}