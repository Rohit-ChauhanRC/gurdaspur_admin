import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/modules/utils/contants.dart';
import 'package:gurdaspur_admin/app/modules/utils/utils.dart';
import 'package:gurdaspur_admin/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey();

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

  // final RxList<LoginModel> _loginModel = RxList<LoginModel>();
  // List<LoginModel> get loginModel => _loginModel;
  // set loginModel(List<LoginModel> lst) => _loginModel.assignAll(lst);

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> login() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
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
        "UserId": "1",
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
