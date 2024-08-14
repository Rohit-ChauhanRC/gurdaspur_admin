import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:gurdaspur_admin/app/modules/utils/utils.dart';
import 'package:http/http.dart' as http;

class FranchiseController extends GetxController {
  //
  GlobalKey<FormState> loginFormKey = GlobalKey();

  final RxString _centerId = ''.obs;
  String get centerId => _centerId.value;
  set centerId(String mob) => _centerId.value = mob;

  final RxString _response = ''.obs;
  String get response => _response.value;
  set response(String mob) => _response.value = mob;

  final RxString _act = ''.obs;
  String get act => _act.value;
  set act(String mob) => _act.value = mob;

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final count = 0.obs;
  @override
  void onInit() {
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

  // void increment() => count.value++;
  loginCred() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }
    circularProgress = false;
    await fetchData();
  }

  fetchData() async {
    try {
      var res = await http.get(
        Uri.parse("http://Plant.Maklife.in:6019/Api/CustomerName?ID=$centerId"),
      );
      final a = jsonDecode(res.body);

      if (res.statusCode == 200) {
        circularProgress = true;
        act = a.split("")[a.split("").length - 1];
        response = a;
      }
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }

  // http://Plant.Maklife.in:6019/Api/CustomerStatus/Updatestatus?ID=90600001&Status=A

  activateF(String active) async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }
    circularProgress = false;
    try {
      var res = await http.post(
          Uri.parse(
              "http://Plant.Maklife.in:6019/Api/CustomerStatus/Updatestatus"),
          body: {"Id": centerId, "Status": active});
      final a = jsonDecode(res.body);

      if (res.statusCode == 200) {
        if (a == "Updated") {
          // active == "A" ? act = "Z" : "A";
          await fetchData();
        }
        // circularProgress = true;
      }
    } catch (e) {
      // apiLopp(i);
      // circularProgress = true;
    }
  }
}
