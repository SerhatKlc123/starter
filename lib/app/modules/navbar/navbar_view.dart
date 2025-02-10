import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_template/app/modules/navbar/navbar_controller.dart';

class NavbarView extends StatelessWidget {
  NavbarView({super.key});
  final _navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
          ()=> BottomNavigationBar(
            currentIndex: _navbarController.getIndex(),
            onTap: (index) => _navbarController.setIndex(index),
            selectedIconTheme:
                IconThemeData(color: Colors.blue.shade500, size: 20),
            selectedItemColor: Colors.blue.shade500,
            unselectedIconTheme:
                IconThemeData(color: Colors.grey.shade300, size: 20),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(_navbarController.getItem(0).icon), label: _navbarController.getItem(0).title),
              BottomNavigationBarItem(
                  icon: Icon(_navbarController.getItem(1).icon), label: _navbarController.getItem(1).title),
            ]),
      ),
      body: Obx(() {
        return _navbarController.getScreen();
      }),
    );
  }
}
