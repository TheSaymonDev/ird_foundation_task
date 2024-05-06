import 'package:get/get.dart';
import 'package:ird_foundation_task/presentation/controllers/hadith_controller.dart';

class HadithBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => HadithController());
  }
}