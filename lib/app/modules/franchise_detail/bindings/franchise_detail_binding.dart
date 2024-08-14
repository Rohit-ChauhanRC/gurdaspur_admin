import 'package:get/get.dart';

import '../controllers/franchise_detail_controller.dart';

class FranchiseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FranchiseDetailController>(
      () => FranchiseDetailController(),
    );
  }
}
