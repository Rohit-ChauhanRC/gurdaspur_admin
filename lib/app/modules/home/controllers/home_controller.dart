import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _userId = 0.obs;
  int get userId => _userId.value;
  set userId(int i) => _userId.value = i;

  final RxString _employeeName = ''.obs;
  String get employeeName => _employeeName.value;
  set employeeName(String mob) => _employeeName.value = mob;

  final RxString _flag = ''.obs;
  String get flag => _flag.value;
  set flag(String mob) => _flag.value = mob;

  final RxInt _plant = 0.obs;
  int get plant => _plant.value;
  set plant(int i) => _plant.value = i;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    userId = Get.arguments[0];
    employeeName = Get.arguments[1];
    flag = Get.arguments[2];
    plant = Get.arguments[3];
  }

  @override
  void onClose() {
    super.onClose();
    _employeeName.close();
    _flag.close();
    _plant.close();
    _userId.close();
  }
}
