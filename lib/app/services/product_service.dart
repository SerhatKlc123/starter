import 'package:starter_template/app/modules/navbar/products/product_model.dart';
import 'package:starter_template/app/services/api_service.dart';
import 'package:starter_template/app/shared/utils/constants.dart';

class ProductService {
   Future<List<ProductModel>> fetchProducts() async {
    try {
      var response = await ApiService.instance.get(ApiConstants.products);
      var data = (response.data['products'] ?? []) as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
