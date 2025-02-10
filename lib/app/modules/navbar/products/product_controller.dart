import 'package:get/get.dart';
import 'package:starter_template/app/modules/navbar/products/product_model.dart';
import 'package:starter_template/app/services/product_service.dart';

class ProductController extends GetxController {
  final _productService = ProductService();
  var products = <ProductModel>[];
  final load = false.obs;

  void fetchProducts() async {
    try {
      _setLoad(true);
      products = await _productService.fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _setLoad(false);
    }
  }

  _setLoad(value) => load.value = value;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
