import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
   TabController controller;
  RxInt selectedIndex = 0.obs;
  RxString headerText = 'JAN'.obs;


  headerTextChoosing()  {
    if(selectedIndex.value == 0){
      headerText .value= 'JAN';
    }
    else if( selectedIndex.value == 1 ) {
      headerText .value= 'FEB';
    }
    else if( selectedIndex.value == 2 ) {
      headerText .value= 'MAR';
    }
    else if( selectedIndex.value == 3 ) {
      headerText .value= 'APR';
    }
    else if( selectedIndex.value == 4 ) {
      headerText .value= 'MAY';
    }
    else if( selectedIndex.value == 5 ) {
      headerText .value= 'JUN';
    }
  }

}