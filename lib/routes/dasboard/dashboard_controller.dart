import 'package:get/get.dart';

class DashBoardController extends GetxController {
  RxInt indexDasboard = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setSelectedIndexPage({int index = 0}) {
    indexDasboard.value = index;
  }



}