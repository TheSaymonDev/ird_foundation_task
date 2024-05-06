import 'package:get/get.dart';
import 'package:ird_foundation_task/domain/bindings/hadith_binding.dart';
import 'package:ird_foundation_task/domain/bindings/splash_binding.dart';
import 'package:ird_foundation_task/presentation/routes/app_routes.dart';
import 'package:ird_foundation_task/presentation/screens/hadith_screen.dart';
import 'package:ird_foundation_task/presentation/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.hadith,
        page: () => const HadithScreen(),
        binding: HadithBinding()),
  ];
}
