import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/theme/app_colors.dart';
import 'package:gurdaspur_admin/app/widgets/text_form_widget.dart';

import '../controllers/franchise_controller.dart';

class FranchiseView extends GetView<FranchiseController> {
  const FranchiseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Franchise Activation/Deactivation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Franchise Id:",
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
                        initialValue: controller.centerId,
                        onChanged: (val) => controller.centerId = val,
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
                controller.circularProgress
                    ? ElevatedButton(
                        onPressed: () {
                          controller.loginCred();
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(color: AppColors.white),
                        ))
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                Obx(() => controller.response.isNotEmpty
                    ? controller.response == "No record found"
                        ? Text(controller.response)
                        : Card(
                            elevation: 10,
                            color: AppColors.darkBrown,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(controller.response),
                                  ElevatedButton(
                                      onPressed: () {
                                        controller.activateF(
                                            controller.act == "A" ? "Z" : "A");
                                      },
                                      child: Text(
                                        controller.act == "A"
                                            ? "Deactivate"
                                            : "Activate",
                                        style: const TextStyle(
                                            color: AppColors.white),
                                      ))
                                ],
                              ),
                            ),
                          )
                    : const SizedBox()),
              ],
            )),
      ),
    );
  }
}
