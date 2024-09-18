import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_page_controller.dart';

class DetailsPageView extends GetView<DetailsPageController> {
  const DetailsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailsPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
