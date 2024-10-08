import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_page_controller.dart';

class DetailsPageView extends GetView<DetailsPageController> {
  const DetailsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0XFF6f2da8),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          // Text(controller.productModel!.data!.firstName.toString()),
          // Text(controller.productModel!.data!.email.toString()),
          // Text(controller.productModel!.data!.avatar.toString()),
        ],
      ),
    );
  }
}
