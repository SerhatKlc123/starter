import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  static final _box = GetStorage();
  static const baseURL = 'https://';
  static const auth = 'auth';


  static var dio = Dio(BaseOptions(baseUrl: baseURL));

  static Dio service(){
    ApiService.dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = _box.read('token');
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    return ApiService.dio;
  }

}
