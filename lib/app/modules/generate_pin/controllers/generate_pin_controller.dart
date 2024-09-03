import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gurdaspur_admin/app/modules/utils/contants.dart';
import 'package:gurdaspur_admin/app/modules/utils/utils.dart';
import 'package:http/http.dart' as http;

class GeneratePinController extends GetxController {
  GlobalKey<FormState> pinFormKey = GlobalKey();

  final RxString _username = ''.obs;
  String get username => _username.value;
  set username(String mob) => _username.value = mob;

  final RxString _pinCode = ''.obs;
  String get pinCode => _pinCode.value;
  set pinCode(String mob) => _pinCode.value = mob;

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxInt _userId = 0.obs;
  int get userId => _userId.value;
  set userId(int i) => _userId.value = i;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    userId = Get.arguments[0];
  }

  @override
  void onClose() {
    super.onClose();
    _circularProgress.close();
    _pinCode.close();
    _username.close();
    _userId.close();
  }

  // void increment() => count.value++;

  loginCred() async {
    Utils.closeKeyboard();
    if (!pinFormKey.currentState!.validate()) {
      return null;
    }
    circularProgress = false;
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/Pinmaster"),
        body: {
          "CenterId": username,
          "PinNo": pinCode,
          "UserId": userId.toString(),
        },
      );
      final a = jsonDecode(res.body);

      if (res.statusCode == 200) {
        if (a == "Pin generated successfully !") {
          Utils.showSnackbar(a);
          Get.back();
        } else if (a == "Invalid CenterId ?") {
          Utils.showDialog(a);
        } else if (a == "Pin already exists ($pinCode)") {
          Utils.showDialog(a);
        }
        circularProgress = true;
      }
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }
}
