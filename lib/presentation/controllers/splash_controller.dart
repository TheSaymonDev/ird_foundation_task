import 'dart:async';

import 'package:get/get.dart';
import 'package:ird_foundation_task/presentation/routes/app_routes.dart';

class SplashController extends GetxController {
  void moveToHadithScreen() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Get.toNamed(AppRoutes.hadith);
    });
  }
}
