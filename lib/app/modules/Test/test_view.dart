import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_template/app/routers/app_routes.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: ()=> Get.toNamed(Routes.home), child: Text('Home')),),
    );
  }
}
