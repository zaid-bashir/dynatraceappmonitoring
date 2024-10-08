// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dynatrace_app_monitoring/app/modules/homePage/models/products.dart';
import 'package:dynatrace_app_monitoring/app/services/apiurls.dart';

class ApiService {
  //Initialise Dio
  //==============
  final Dio dioForApiService = Dio();

  //Get Service For getProductsService
  //==============================================
  Future<ProductModel> getProducts() async {
    ProductModel? productModel;
    print("Get Service For Get Products");
    try {
      Response response =
          await dioForApiService.get(ApiUrls.productApiUrl);
      print('API Response');
      print(response.data);
      print(response.statusCode);
      productModel = ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Get Products Error....');
        print('STATUS CODE : ${e.response?.statusCode}');
        print('DATA : ${e.response?.data}');
        print('HEADERS : ${e.response?.headers}');
      } else {
        print('Error Sending Request!');
        print(e.message.toString());
      }
    }
    return productModel!;
  }
}