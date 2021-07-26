import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/constants/controller.dart';
import 'package:hyhderbad_company_task/constants/text_widget.dart';
import 'package:hyhderbad_company_task/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseAuth auth;
  User user;
  bool isLoading = true;

  share()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loginController.isLoggedIn.value = sharedPreferences.getBool('isLoggedIn');
    print(loginController.isLoggedIn.value);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share();
    Future.delayed(Duration(seconds: 4),(){
    if(loginController.isLoggedIn.value == true){
      Get.offAll(Dashboard());
    }
    else
      {
        Get.defaultDialog(
          title: 'Enter Your  Mobile Number',
          content: Obx(
            ()=> Column(
              children: [
                loginController.getMobileFormWidget(context) ,
                SizedBox(
                  height: size.height * 0.05,
                ),
                loginController.showLoading.value ? CircularProgressIndicator(backgroundColor: Colors.white,) : loginController.currentState != MobileVerificationState.SHOW_MOBILE_FORM_STATE ? loginController.getOtpFormWidget(context) : Container(),
                SizedBox(
                  height: size.height * 0.07,
                ),
                InkWell(
                  onTap: (){
                    if(loginController.currentState == MobileVerificationState.SHOW_OTP_FORM_STATE){
                      loginController.otpOnpressed();
                    }
                    else
                    {
                      Get.snackbar('Warning', 'Please get the OTP first');
                    }
                  },
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft:  Radius.circular(12),topRight:  Radius.circular(12),bottomRight:  Radius.circular(12),),
                      color: Color(0xFF178DBC),
                      // borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child:Center(child: customText(Colors.white, 'Login', size.height * 0.03, FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
        );
      };
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),  color: Colors.black,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.calendar_today_sharp,size: 100,color: Colors.white,)
              // Image.asset(
              //   'assets/logo.jpeg',
              //   width: double.infinity,
              // ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
           DefaultTextStyle(
            style: const TextStyle(
            fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold
             ),
            child: AnimatedTextKit(
             animatedTexts: [
             WavyAnimatedText('Welcome'),

               ],
            isRepeatingAnimation: true,
           onTap: () {
            print("Tap Event");
             },
            ),
            ),
          SizedBox(
            height: 10,
          ),
          Loading()
        ],
      ),
    );
  }
}


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SpinKitFadingCircle(
          color: Color(0xFF9C27B0),
          size: 30,
        ));
  }
}