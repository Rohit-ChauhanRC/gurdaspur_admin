import 'package:get/get.dart';

import '../controllers/generate_pin_controller.dart';

class GeneratePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneratePinController>(
      () => GeneratePinController(),
    );
  }
}
