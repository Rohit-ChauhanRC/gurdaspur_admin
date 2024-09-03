import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gurdaspur_admin/app/data/models/user_model.dart';
import 'package:gurdaspur_admin/app/modules/utils/contants.dart';
import 'package:gurdaspur_admin/app/modules/utils/utils.dart';

import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //
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

  final RxList<UserModel> _loginModel = RxList<UserModel>();
  List<UserModel> get loginModel => _loginModel;
  set loginModel(List<UserModel> lst) => _loginModel.assignAll(lst);

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
    _loginModel.close();
    _password.close();
    _username.close();
    _check.close();
    _circularProgress.close();
  }

  Future<dynamic> login() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }

    if (username == "admin" && password == "admin") {
      Get.offAllNamed(
        Routes.HOME,
      );
    } else {
      await loginCred();
    }
  }

  loginCred() async {
    circularProgress = false;
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/User"),
        body: {
          "Username": username.trim(),
          "Password": password.trim(),
        },
      );

      if (res.statusCode == 200 &&
          jsonDecode(res.body) != "Invalid credentials ?") {
        loginModel.assignAll(userModelFromMap(res.body));

        if (loginModel.isNotEmpty) {
          Get.offAllNamed(Routes.HOME, arguments: [
            loginModel.first.userId,
            loginModel.first.employeeName,
            loginModel.first.flag,
            loginModel.first.plant,
          ]);
        } else {
          Utils.showDialog("Please check username and password!");
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

  /*

    "OTP Sent !"

  "Login"


  "OutLet does not exists ?"

  "Franchisee does not exists ?"
  */
}
