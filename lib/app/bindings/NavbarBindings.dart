import 'package:get/get.dart';
import 'package:starter_template/app/modules/navbar/navbar_controller.dart';
import 'package:starter_template/app/modules/navbar/products/product_controller.dart';

class NavbarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(()=> ProductController());
    Get.put(NavbarController());
  }

}