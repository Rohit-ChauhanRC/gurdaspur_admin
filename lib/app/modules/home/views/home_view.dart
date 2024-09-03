import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/routes/app_pages.dart';
import 'package:gurdaspur_admin/app/theme/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150.h,
              width: 200.w,
              margin: EdgeInsets.only(top: 20.h),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                // height: Get.height * 0.5,
                alignment: Alignment.center,
                scale: 1,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Obx(
              () => controller.flag == "P"
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.GENERATE_PIN,
                              arguments: [controller.userId]);
                        },
                        child: const Text(
                          "Pin Generate",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.FRANCHISE,
                              arguments: [controller.userId]);
                        },
                        child: const Text(
                          "Franchise Activation / Deactivation",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
