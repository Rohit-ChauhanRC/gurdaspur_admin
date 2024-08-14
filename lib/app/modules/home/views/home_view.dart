import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/routes/app_pages.dart';
import 'package:gurdaspur_admin/app/theme/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.GENERATE_PIN);
              },
              child: const Text(
                "Pin Generate",
                style: TextStyle(color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.FRANCHISE);
                },
                child: const Text(
                  "Franchise Activation / Deactivation",
                  style: TextStyle(color: AppColors.white),
                )),
          ],
        ),
      ),
    );
  }
}
