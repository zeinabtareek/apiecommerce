import 'package:get/get.dart';
import 'package:hiveproject/model/cart_product_model.dart';
import 'package:hiveproject/model/item2.dart';
import '../db.dart';

class CartController extends GetxController{

  final cartProductModel =<CartProductModel>[].obs;
  final  _totalPrice = 0.0.obs;
  double get totalPrice =>_totalPrice.value;
  // var items = List<ItemModel>.empty().obs;


  @override
  void onInit() async {
    super.onInit();
    getAllProductList();
  }


 addToCart(CartProductModel cartProductModel)async{
    var dbHelper =CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
        print(_totalPrice);
      Get.snackbar('Product Added', 'you have added the ${cartProductModel.title} to the cart ',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      update();
  }
 getAllProductList()async{
  var dbHelper =CartDatabaseHelper.db;
 cartProductModel.value=await dbHelper.getAllProduct();
  update();
  print(cartProductModel.length);
   }
}