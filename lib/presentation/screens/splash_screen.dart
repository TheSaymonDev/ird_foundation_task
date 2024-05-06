import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ird_foundation_task/core/constants/app_img_url.dart';
import 'package:ird_foundation_task/core/utils/app_colors.dart';
import 'package:ird_foundation_task/presentation/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>().moveToHadithScreen();
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Center(
        child: Image.asset(AppImgUrl.appLogo, width: 200.w,),
      ),
    );
  }
}
