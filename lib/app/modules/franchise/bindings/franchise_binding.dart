import 'package:get/get.dart';

import '../controllers/franchise_controller.dart';

class FranchiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FranchiseController>(
      () => FranchiseController(),
    );
  }
}
