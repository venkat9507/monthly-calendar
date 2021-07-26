import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/controller/login_controller/login_controller.dart';
import 'package:hyhderbad_company_task/controller/months_controller/jan_controller.dart';
import 'package:hyhderbad_company_task/screens/dashboard.dart';
import 'package:hyhderbad_company_task/screens/splash_screen.dart';

import 'constants/firebase_constant.dart';
import 'controller/dashboard_controller/dashboard_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) async {
    // Get.put(LoginController());
    Get.put(DashboardController());
    Get.put(DatesController());
    Get.put(LoginController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      SplashScreen(),
    );
  }
}
