import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hiveproject/model/item2.dart';
import 'package:hiveproject/model/item_model.dart';
import 'package:hiveproject/services/api.dart';

class HomeController extends GetxController {
  var categoryItems = List<String>.empty().obs;
  var itemItems =<ItemModel>[].obs;
  var loading = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchItems();
  }
  void fetchCategories() async {
    var getItems = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];
    categoryItems.value = getItems;
  }
  void fetchItems() async {
    loading.value = true;
    itemItems.clear();
    var getItems = await RemoteServices.tryAnotherFunc();
    loading.value = false;
    if (getItems != null) {
      getItems.forEach((item) {
         itemItems.add(ItemModel.fromJson(item));
      });
    }update();
  }
  // ItemModel getDetails(int index){
  //   return itemItems[index];
  // }
}