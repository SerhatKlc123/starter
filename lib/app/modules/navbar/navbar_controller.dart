import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_template/app/modules/navbar/navbar_model.dart';
import 'package:starter_template/app/modules/navbar/products/product_view.dart';
import 'package:starter_template/app/modules/navbar/users/users_view.dart';

class NavbarController extends GetxController {
  final _index = 0.obs;
  final _navbarItems = <NavbarModel>[
    NavbarModel(title: 'Products', icon: Icons.shopping_cart),
    NavbarModel(title: 'Users', icon: Icons.person),
  ];
  final _screens = <Widget>[ProductView(), UsersView()];

  void setIndex(int index) => _index.value = index;
  int getIndex() => _index.value;

  NavbarModel getItem(index) => _navbarItems[index];

  Widget getScreen() => _screens[_index.value];

  @override
  void onInit() {
    super.onInit();
    setIndex(0);
  }
}
