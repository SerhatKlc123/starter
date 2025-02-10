import 'package:get/get.dart';
import 'package:starter_template/app/bindings/NavbarBindings.dart';
import 'package:starter_template/app/modules/Test/test_view.dart';
import 'package:starter_template/app/modules/navbar/navbar_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/home', page: () => NavbarView(), binding: NavbarBinding()),
    GetPage(name: '/test', page: () => TestView()),
  ];
}
