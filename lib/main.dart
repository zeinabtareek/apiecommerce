
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/screen/splash.dart';
import 'adapter/cart_hive_adapter.dart';
import 'model/item_model.dart';

  main()async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: SplashPage(),
    );
  }
}
