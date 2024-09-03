import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gurdaspur_admin/app/modules/utils/contants.dart';
import 'package:gurdaspur_admin/app/modules/utils/utils.dart';
import 'package:gurdaspur_admin/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> resetFormKey = GlobalKey();

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

  final RxString _fromDate = "${DateTime.now()}".obs;
  String get fromDate => _fromDate.value;
  set fromDate(String str) => _fromDate.value = str;

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
    _check.close();
    _circularProgress.close();
    _fromDate.close();
    _password.close();
    _username.close();
  }

  Future<dynamic> login() async {
    Utils.closeKeyboard();
    if (!resetFormKey.currentState!.validate()) {
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
    var pj = DateFormat("MM/dd/yyyy").format(DateTime.parse(fromDate));

    try {
      var res = await http.post(Uri.parse("$baseUrl/ForgetPassword"), body: {
        "Username": username.trim(),
        "Dob": DateFormat("ddMMMyyyy").format(DateTime.parse(fromDate)),
        "Adharno": password.trim(),
      });
      final a = jsonDecode(res.body);

      if (res.statusCode == 200) {
        // loginModel.assignAll(loginModelFromMap(res.body));

        if (jsonDecode(res.body) == "User does not exists ?") {
          Utils.showDialog(res.body);
        } else if (jsonDecode(res.body) ==
            "Date of birth and Adhaar mismatch ?") {
          Utils.showDialog(res.body);
        } else {
          Get.toNamed(
            Routes.FORGOT_PASSWORD,
            arguments: [jsonDecode(res.body)],
          );
        }
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
