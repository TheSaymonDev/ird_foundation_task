import 'package:get/get.dart';
import 'package:ird_foundation_task/data/local/db_helper.dart';
import 'package:ird_foundation_task/data/models/hadith_model.dart';

class HadithController extends GetxController{
  List<HadithModel>  hadithList =[];
  bool isLoading = false;
 Future<void> loadHadith() async{
    isLoading = true;
    update();
    hadithList = await DbHelper().getHadithByChapterAndBookId(1, 1);
    if(hadithList.isNotEmpty){
      isLoading = false;
      update();
    }else{
      isLoading = false;
      update();
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadHadith();
  }
}