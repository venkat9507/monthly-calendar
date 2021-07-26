import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/constants/controller.dart';
import 'package:hyhderbad_company_task/screens/splash_screen.dart';


class DatesController extends GetxController {
  static DatesController instance = Get.find();
  final date5Controller = TextEditingController();
  final date10Controller = TextEditingController();
  final date15Controller = TextEditingController();
  final date20Controller = TextEditingController();
  final date25Controller = TextEditingController();


  RxBool isJan = false.obs;
  RxBool isFeb = false.obs;
  RxBool isMar = false.obs;
  RxBool isApr = false.obs;
  RxBool isMay = false.obs;
  RxBool isJun = false.obs;
  RxBool resultShow = false.obs;

  int janValue = 0;
  int febValue = 0;
  int marValue = 0;
  int aprValue = 0;
  int mayValue = 0;
  int junValue = 0;


  RxInt date5 = 0.obs;
  RxInt date10 = 0.obs;
  RxInt date15 = 0.obs;
  RxInt date20 = 0.obs;
  RxInt date25 = 0.obs;


  RxInt storedValue = 0.obs;
  RxInt finalValue = 0.obs;
  validate() {
    if(date5Controller.text != '' && date10Controller.text != '' && date15Controller.text != '' && date20Controller.text != ''&& date25Controller.text != ''){
      storedValue.value = (date5.value + date10.value + date15.value + date20.value + date25.value) ~/ 5;
     print('StoredValue from Validator ${storedValue.value}');
      monthValidator();
      dashboardController.selectedIndex.value += 1;
      dashboardController.selectedIndex.value == 6 ? print('Max limit reched') :   dashboardController.controller.index = dashboardController.selectedIndex.value;




      date5Controller.clear();
      date10Controller.clear();
      date15Controller.clear();
      date20Controller.clear();
      date25Controller.clear();




    }
    else
      {
        Get.snackbar('Fill All', 'Please fill all the month fields');
      }
  }
  monthValidator() {
    if(dashboardController.selectedIndex.value == 0){
      isJan.value = true;
      janValue = storedValue.value;
    }
    else if (dashboardController.selectedIndex.value == 1){
      isFeb.value = true;
      febValue = storedValue.value;
    }
    else if (dashboardController.selectedIndex.value == 2){
      isMar.value = true;
      marValue = storedValue.value;
      print('isMar ${isMar.value}');
      print('marValue inside${marValue}');
      // storedValue.value = 0;
    }
    else if (dashboardController.selectedIndex.value == 3){
      isApr.value = true;
      aprValue = storedValue.value;
    }
    else if (dashboardController.selectedIndex.value == 4){
      isMay.value = true;
      mayValue = storedValue.value;
    }
    else if (dashboardController.selectedIndex.value == 5){
      isJun.value = true;
      junValue = storedValue.value;
    }
    else
      {
        Get.snackbar('Month Validator', 'Month Validator Failed');
      }
  }

  result(){
    if(janValue != 0 && febValue !=0 && marValue !=0 && aprValue != 0 && junValue != 0){
      finalValue.value = (janValue + febValue + marValue + mayValue + aprValue + junValue) ~/ 6;

      Future.delayed(Duration(seconds: 2),(){
        resultShow.value = true;
      });
      Get.defaultDialog(
          title: 'Final Result',
          content:Obx(
            ()=> resultShow.value == false ?  Loading() :  Column(
              children: [
                Text('Over all Count = ${finalValue.value.toString()}'),
              ],
            ),
          )
      ).then((value){
        dashboardController.controller.index = 0;
        isJan.value = false;
        isFeb.value = false;
        isMar.value = false;
        isApr.value = false;
        isMay.value = false;
        isJun.value = false;
        resultShow.value = false;
      });
    }

    else
      {
        Get.snackbar('Error', 'Unknown Error Occur please Check whether you field all Months',duration: Duration(seconds: 5));
      }
  }


}