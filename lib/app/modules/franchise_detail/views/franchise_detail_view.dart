import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/franchise_detail_controller.dart';

class FranchiseDetailView extends GetView<FranchiseDetailController> {
  const FranchiseDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FranchiseDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FranchiseDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
