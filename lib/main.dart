import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

String currentUser = "Zaid Bashir (UAT)";

void main() {
  Dynatrace().startWithoutWidget(
    configuration: const Configuration(
    reportCrash: true,
    logLevel: LogLevel.Debug,
    // beaconUrl,
    // applicationId,
    certificateValidation: true,
    userOptIn: false,
  ));
  Dynatrace().identifyUser("Current User: $currentUser");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dynatrace YourCompass App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}




