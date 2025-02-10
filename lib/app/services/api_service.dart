import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_template/app/shared/utils/constants.dart';

class ApiService {
  static final GetStorage _box = GetStorage();

  // Singleton instance of Dio
  static final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  // Private constructor to prevent external instantiation
  ApiService._() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final String? token = _box.read<String>('token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  // Public method to access Dio instance
  static Dio get instance {
    return _dio;
  }
}
