import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/modules/utils/contants.dart';
import 'package:gurdaspur_admin/app/modules/utils/utils.dart';
import 'package:gurdaspur_admin/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> forgotFormKey = GlobalKey();

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxBool _check = false.obs;
  bool get check => _check.value;
  set check(bool v) => _check.value = v;

  final RxString _username = ''.obs;
  String get username => _username.value;
  set username(String mob) => _username.value = mob;

  final RxString _password = ''.obs;
  String get password => _password.value;
  set password(String mob) => _password.value = mob;

  final RxInt _id = 0.obs;
  int get id => _id.value;
  set id(int i) => _id.value = i;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    id = Get.arguments[0];
  }

  @override
  void onClose() {
    super.onClose();
    _check.close();
    _circularProgress.close();
    _id.close();
    _password.close();
    _username.close();
  }

  Future<dynamic> login() async {
    Utils.closeKeyboard();
    if (!forgotFormKey.currentState!.validate()) {
      return null;
    }

    if (username == "admin" && password == "admin") {
      Get.toNamed(
        Routes.LOGIN,
      );
    } else {
      await loginCred();
    }
  }

  loginCred() async {
    circularProgress = false;
    try {
      var res = await http.post(Uri.parse("$baseUrl/UpdatePassword"), body: {
        "UserId": id.toString(),
        "Password": password,
      });

      if (res.statusCode == 200 &&
          jsonDecode(res.body) == "Password updated successfully !") {
        Get.toNamed(
          Routes.LOGIN,
        );
      } else {
        //
        Utils.showDialog(json.decode(res.body));
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }
}
