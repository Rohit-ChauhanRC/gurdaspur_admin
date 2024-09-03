import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/theme/app_colors.dart';
import 'package:gurdaspur_admin/app/widgets/custom_button.dart';
import 'package:gurdaspur_admin/app/widgets/text_form_widget.dart';
import 'package:intl/intl.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150.h,
              width: 200.w,
              margin: EdgeInsets.only(top: 50.h),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                // height: Get.height * 0.5,
                alignment: Alignment.topCenter,
                scale: 1,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h, left: 35.w, right: 35.w),
              child: Form(
                key: controller.resetFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username:",
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
                            keyboardType: TextInputType.text,
                            // maxLength: 10,
                            validator: (val) =>
                                val!.length < 3 ? "Field is required!" : null,
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Aadhar Card No:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(
                      () => SizedBox(
                        // width: Get.width * 0.7,
                        // height: 65.h,
                        child: TextFormWidget(
                          prefix: const Icon(
                            Icons.remove_red_eye,
                            size: 30,
                          ),
                          // obscureText: true,
                          initialValue: controller.password,
                          label: "Please enter Password...",
                          onChanged: (val) => controller.password = val,
                          keyboardType: TextInputType.text,
                          // maxLength: 10,
                          validator: (val) =>
                              val!.length < 3 ? "Field is required!" : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "DOB: ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDatePicker(
                              context: Get.context!,
                              // initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2101),
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            ).then((selectedDate) async {
                              controller.fromDate =
                                  selectedDate!.toIso8601String();
                              if (kDebugMode) {
                                print(controller.fromDate);
                              }
                            });
                          },
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Obx(
                          () => Text(DateFormat("ddMMMyyyy")
                              .format(DateTime.parse(controller.fromDate))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: Get.width,
              // padding: const EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 15.h, left: 35.w, right: 35.w),
              child: CustomButton(
                onPressed: () {
                  controller.login();
                },
                title: "Verify",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
