import 'package:get/get.dart';
import 'package:ird_foundation_task/presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}