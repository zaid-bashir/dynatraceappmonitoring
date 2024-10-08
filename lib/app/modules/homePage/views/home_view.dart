// ignore_for_file: avoid_print

import 'dart:math';

import 'package:dynatrace_app_monitoring/app/modules/detailsPage/views/details_page_view.dart';
import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {  
  
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    DynatraceRootAction myAction = Dynatrace().enterAction("Initialised Home Page...");
    myAction.leaveAction();
    homeController.fetchProducts();
  }

  // String currentUser = "Zaid Bashir (STAG V1.0)";
  // List of users
List<String> users = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Hannah',
  'Ivan',
  'Jack'
];

// Function to get a random name
String getRandomUser() {
  final random = Random();
  int randomIndex = random.nextInt(users.length);
  return users[randomIndex];
}

void main() {
  // Example: Call the function multiple times
  print(getRandomUser()); // Random user from the list
  print(getRandomUser()); // Random user from the list
  print(getRandomUser()); // Random user from the list
}
  

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: const Text('Dynatrace YourCompass App'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0XFF6f2da8),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: homeController.isProductsLoading.value ? const Center(child: CircularProgressIndicator()) : 
      
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            DynatraceRootAction myHomeAct = Dynatrace().enterAction("Opened Details Page...");
            DynatraceAction mySubAction = myHomeAct.enterAction("Tapped User Detail Tile...");
            myHomeAct.leaveAction();
            mySubAction.leaveAction();
            Get.to(()=>const DetailsPageView(),);
          },
          child: ListTile(
            title: Text(homeController.productModel!.data![index].firstName.toString()),
            subtitle: Text(homeController.productModel!.data![index].email.toString()),
            leading: Image.network(homeController.productModel!.data![index].avatar.toString()),
          ),
        );
      }, itemCount: homeController.productModel!.data!.length),),
          const SizedBox(height: 60,),
          ElevatedButton(onPressed: (){
            Dynatrace().identifyUser("${getRandomUser()} (STAG V1.0)");
            homeController.isProductsLoading.value = true;
            homeController.fetchProducts();
            homeController.isProductsLoading.value = false;
            DynatraceRootAction myHomeAct = Dynatrace().enterAction("Opened Details Page...");
            DynatraceAction mySubAction = myHomeAct.enterAction("Tapped User Detail Tile...");
            myHomeAct.leaveAction();
            mySubAction.leaveAction();
          }, child: const Text("Refresh"),),
          const SizedBox(height: 60,),
          ElevatedButton(onPressed: (){
            Dynatrace().endSession();
            homeController.isProductsLoading.value = true;
            homeController.fetchProducts();
            homeController.isProductsLoading.value = false;
            DynatraceRootAction myHomeAct = Dynatrace().enterAction("Opened Details Page...");
            DynatraceAction mySubAction = myHomeAct.enterAction("Tapped User Detail Tile...");
            myHomeAct.leaveAction();
            mySubAction.leaveAction();
          }, child: const Text("CLOSE"),),
        ],),
      ),
    );
  }
}
