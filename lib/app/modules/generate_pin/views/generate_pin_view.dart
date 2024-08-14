import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/theme/app_colors.dart';
import 'package:gurdaspur_admin/app/widgets/text_form_widget.dart';

import '../controllers/generate_pin_controller.dart';

class GeneratePinView extends GetView<GeneratePinController> {
  const GeneratePinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Pin'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150.h,
                  width: 200.w,
                  margin: EdgeInsets.only(top: 20.h),
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.fill,
                    // height: Get.height * 0.5,
                    alignment: Alignment.topCenter,
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Center Id:",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => SizedBox(
                      // width: Get.width * 0.7,
                      // height: 65.h,
                      child: TextFormWidget(
                        prefix: const Icon(
                          Icons.person_4_sharp,
                          size: 30,
                        ),
                        initialValue: controller.username,
                        label: "Please enter Username...",
                        onChanged: (val) => controller.username = val,
                        // keyboardType: TextInputType.number,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: false, decimal: true),

                        // maxLength: 10,
                        validator: (val) =>
                            val!.length < 1 ? "Field is required!" : null,
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pin Code:",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => SizedBox(
                      // width: Get.width * 0.7,
                      // height: 65.h,
                      child: TextFormWidget(
                        prefix: const Icon(
                          Icons.person_4_sharp,
                          size: 30,
                        ),
                        initialValue: controller.pinCode,
                        label: "Please enter Username...",
                        onChanged: (val) => controller.pinCode = val,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: false, decimal: true),
                        maxLength: 4,
                        validator: (val) =>
                            val!.length < 3 ? "Field is required!" : null,
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                controller.circularProgress
                    ? ElevatedButton(
                        onPressed: () {
                          controller.loginCred();
                        },
                        child: const Text(
                          "Generate Pin",
                          style: TextStyle(color: AppColors.white),
                        ))
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
