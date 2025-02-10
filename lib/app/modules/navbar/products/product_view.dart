import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_template/app/modules/navbar/products/product_controller.dart';
import 'package:starter_template/app/routers/app_routes.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  final _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_productController.load.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(itemBuilder: (ctx, i) {
        final product = _productController.products[i];
        return ListTile(
          onTap: ()=> Get.offAndToNamed(Routes.test),
          title: Text(product.title),
          subtitle: Text(product.price.toStringAsFixed(1)),
        );
      },
      itemCount: _productController.products.length,
      );
    });
  }
}
