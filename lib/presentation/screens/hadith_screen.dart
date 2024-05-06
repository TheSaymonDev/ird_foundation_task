import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ird_foundation_task/core/utils/app_colors.dart';
import 'package:ird_foundation_task/presentation/controllers/hadith_controller.dart';
import 'package:ird_foundation_task/presentation/widgets/custom_shape.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: GetBuilder<HadithController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.whiteClr),
                )
              : SafeArea(
                  child: SizedBox(
                    height: double.infinity.h,
                    width: double.infinity.w,
                    child: Column(
                      children: [
                        _buildHadithTitle(controller),
                        Expanded(
                          child: Container(
                            height: double.infinity.h,
                            width: double.infinity.w,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: AppColors.bgGreyColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.r),
                                topLeft: Radius.circular(20.r),
                              ),
                            ),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return _buildHadithItem(
                                      index, myTextStyle, controller);
                                },
                                separatorBuilder: (context, index) => Gap(10.h),
                                itemCount: controller.hadithList.length),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  Padding _buildHadithTitle(HadithController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios,
                color: AppColors.whiteClr, size: 22.sp),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.hadithList[1].bookName!,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteClr),
              ),
              Gap(4.h),
              Text(
                'ওহীর সূচনা অধ্যায়',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.whiteClr,
                fontFamily: 'Kalpurush'),
              ),
            ],
          ),
          const Spacer(
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu_open, size: 30.sp, color: AppColors.whiteClr))
        ],
      ),
    );
  }

  Column _buildHadithItem(
      int index, TextTheme myTextStyle, HadithController controller) {
    return Column(
      children: [
        Gap(16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.whiteClr),
          child: Text('1/${index + 1} Chapter:',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenColor)),
        ),
        Gap(8.h),
        Container(
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.whiteClr),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomShape(color: AppColors.greenColor, title: 'B'),
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.hadithList[0].bookName!,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackClr),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenColor),
                            text: 'Hadith No: ',
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor),
                                  text: "${index + 1}"),
                            ]),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.greenColor),
                    child: Text(
                      '${controller.hadithList[index].grade}',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.whiteClr,
                          fontFamily: 'Kalpurush'),
                    ),
                  ),
                  Gap(16.w),
                  const Icon(Icons.more_vert)
                ],
              ),
              Gap(16.h),
              Text(
                '${controller.hadithList[index].ar}',
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackClr,
                    fontFamily: 'Kfgq',
                    height: 1.8),
                textAlign: TextAlign.right,
              ),
              Gap(16.h),
              Text(
                '${controller.hadithList[index].narrator} থেকে বর্ণিতঃ ',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.greenColor,
                    fontFamily: 'Kalpurush'),
              ),
              Gap(16.h),
              Text('${controller.hadithList[index].bn}',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackClr,
                      fontFamily: 'Kalpurush')),
              Gap(16.h),
            ],
          ),
        )
      ],
    );
  }
}
