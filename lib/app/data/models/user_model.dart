// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

List<UserModel> userModelFromMap(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromMap(x)));

String userModelToMap(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserModel {
  String? username;
  String? employeeName;
  String? flag;
  int? plant;
  String? adharno;
  String? dob;
  String? url;
  int? userId;

  UserModel({
    this.username,
    this.employeeName,
    this.flag,
    this.plant,
    this.adharno,
    this.dob,
    this.url,
    this.userId,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        username: json["Username"],
        employeeName: json["EmployeeName"],
        flag: json["Flag"],
        plant: json["Plant"],
        adharno: json["Adharno"],
        dob: json["Dob"],
        url: json["Url"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toMap() => {
        "Username": username,
        "EmployeeName": employeeName,
        "Flag": flag,
        "Plant": plant,
        "Adharno": adharno,
        "Dob": dob,
        "Url": url,
        "UserId": userId,
      };
}
