// ignore_for_file: unnecessary_overrides, avoid_print
import 'package:dynatrace_app_monitoring/app/modules/homePage/models/products.dart';
import 'package:dynatrace_app_monitoring/app/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();
  RxBool isProductsLoading = false.obs;
  void setProductLoading(bool value) {
    isProductsLoading.value = value;
  }

  bool getProductLoading() {
    return isProductsLoading.value;
  }

  ProductModel? productModel;

  void fetchProducts() async {
    isProductsLoading.value = true;
    productModel = await apiService.getProducts();
    if (productModel!.data!.isEmpty) {
      Get.dialog(const Center(child: Text("No Products Found")));
      isProductsLoading.value = false;
    } else {
      print('Products Fetched Successfully');
      isProductsLoading.value = false;
    }
  }

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
}
