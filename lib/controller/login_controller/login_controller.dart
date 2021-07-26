import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/constants/text_widget.dart';
import 'package:hyhderbad_company_task/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';





class LoginController extends GetxController {
  static LoginController instance = Get.find();



  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController =  TextEditingController();
  RxBool isLoggedIn = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId;
  RxBool showLoading =false.obs;




  getMobileFormWidget(context){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.07,
            width: size.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft:  Radius.circular(12),),
                border: Border.all(color: Colors.grey.shade400)),
            child: TextFormField(
              controller: phoneController,
              style: TextStyle(color: Colors.black),
              validator: (String value) {
                if (value.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              onChanged: (value){
              },
              autofillHints: [AutofillHints.givenName],
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText:'Phone No:' ,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width * 0.05,
                ),
                // hoverColor: Colors.white,
                filled: false,
                fillColor: Colors.white
                // focusColor: Colors.white
              ),
            ),
          ),
          Container(
            height: size.height * 0.07,
            width: size.width * 0.15,
            decoration: BoxDecoration(
                color:Color(0xFF178DBC),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
                border: Border.all(color: Colors.grey.shade400)),
            child:  IconButton(icon: Icon(Icons.arrow_forward_sharp,color: Colors.white,), onPressed: mobileNumberOnPressed),
          ),

        ],
      );
  }

  void mobileNumberOnPressed() async{
    showLoading.value = true;
    await auth.verifyPhoneNumber(phoneNumber: '+91${phoneController.text}',
        verificationCompleted: (phoneAuthCredential)async {
          showLoading.value = false;
        },
        verificationFailed: (verificationFailed)async {
          showLoading.value = false;
          Get.snackbar('Failed', verificationFailed.message);
        },
        codeSent: (verificationId,resendingToken) async {

          showLoading.value = false;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          this.verificationId = verificationId;
          update();
        }, codeAutoRetrievalTimeout: (verificationId) async {

        });
  }


  getOtpFormWidget(context){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.07,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft:  Radius.circular(12),topRight:  Radius.circular(12),bottomRight:  Radius.circular(12),),
                border: Border.all(color: Colors.grey.shade400)),
            child: TextFormField(
              controller: otpController,
              style: TextStyle(color: Colors.black),
              validator: (String value) {
                if (value.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              onChanged: (value){
              },
              autofillHints: [AutofillHints.givenName],
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText:'Verify Otp:' ,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width * 0.05,
                ),
                filled: false,
              ),
            ),
          ),

        ],
      );
  }

  void otpOnpressed(){
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential,);
  }


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential,) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showLoading.value = true;
    try{
      final authCredential =await auth.signInWithCredential(phoneAuthCredential);
      showLoading.value = false;
      if(authCredential.user != null){
      isLoggedIn.value = true;
        preferences.setBool('isLoggedIn',  true);
        print(' phoneController.text ${ phoneController.text}');
        Get.offAll(Dashboard());
      }
    }
    on FirebaseAuthException catch (e){
      showLoading.value = false;
      Get.snackbar('Error', e.message);
    }
  }
}