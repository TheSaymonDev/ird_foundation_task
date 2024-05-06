import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ird_foundation_task/core/utils/app_colors.dart';

class CustomShape extends StatelessWidget {
  final Color color;
  final String title;
  const CustomShape({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: 65.h,
      child: ClipPolygon(
        sides: 6,
        borderRadius: 5.0.r,
        rotate: 60.0,
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.whiteClr),
          ),
        ),
      ),
    );
  }
}
