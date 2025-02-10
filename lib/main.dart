import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_template/app/modules/navbar/navbar_view.dart';
import 'package:starter_template/app/routers/app_pages.dart';
import 'package:starter_template/app/routers/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // Set orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final _designSize = const Size(393, 853);
  @override
  Widget build(BuildContext context) {
    //_platform.getPlatform(context);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: _designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return GetMaterialApp(
          getPages: AppPages.routes,
          initialRoute: Routes.home,
          title: 'Template App',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    );
  }
}
