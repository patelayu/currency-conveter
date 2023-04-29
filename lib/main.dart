
import 'package:currencyconveter/screen/homepage.dart';
import 'package:currencyconveter/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/",
          page: () => const SplashPage(),
        ),
        GetPage(
          name: "/HomePage",
          page: () => const HomePage(),
        ),
      ],
    ),
  );
}