import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_template/screens/home.dart';

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
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.grey.shade50,
                appBarTheme: const AppBarTheme(
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    elevation: 0)),
            getPages: [
              GetPage(name: "/", page: () => MyApp()),
            ],
            title: 'Template App',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 500),
            home: Home());
      },
    );
  }
}
