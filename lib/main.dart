import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';


void main() {
  Dynatrace().start(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dynatrace YourCompass App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
