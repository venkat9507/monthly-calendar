import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/constants/controller.dart';
import 'package:hyhderbad_company_task/constants/firebase_constant.dart';
import 'package:hyhderbad_company_task/screens/months/dates_management.dart';
import 'package:hyhderbad_company_task/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.controller = TabController(length: 6, vsync: this,initialIndex: dashboardController.selectedIndex.value
    );
    dashboardController.controller.addListener(() {
      setState(() {
        dashboardController.selectedIndex.value = dashboardController.controller.index;
        dashboardController.headerTextChoosing();
      });

    });
  }




  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF178DBC),
          title: Center(child: Text(dashboardController.headerText.value,style: TextStyle(color: Colors.white,),),),
          actions: [
            IconButton(onPressed: () async{
              SharedPreferences preferences = await SharedPreferences.getInstance();
              auth.signOut();
              preferences.setBool('isLoggedIn',  false);
              Get.offAll(SplashScreen());


            }, icon: Icon(Icons.logout,color: Colors.white,),),
          ],
          bottom: PreferredSize(
              child: TabBar(
                  controller: dashboardController.controller,
                  isScrollable: true,
                  physics: NeverScrollableScrollPhysics(),
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text('JAN'),
                    ),
                    Tab(
                      child: Text('FEB'),
                    ),
                    Tab(
                      child: Text('MAR'),
                    ),
                    Tab(
                      child: Text('APR'),
                    ),
                    Tab(
                      child: Text('MAY'),
                    ),
                    Tab(
                      child: Text('JUN'),
                    ),
                  ],
              ), preferredSize: Size.fromHeight(30)),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: dashboardController.controller,
                children: [
                datesController.isJan.value ? Center(
                  child: Text('Thank You ....You have Already Entered Jan Data',maxLines: 2,),
                ) : DatesManager(),
                  datesController.isFeb.value ? Center(
                    child: Text('Thank You ....You have Already Entered Feb Data',maxLines: 2,),
                  ) : DatesManager(),
                  datesController.isMar.value ? Center(
                    child: Text('Thank You ....You have Already Entered Mar Data',maxLines: 2,),
                  ) : DatesManager(),
                  datesController.isApr.value ? Center(
                    child: Text('Thank You ....You have Already Entered Apr Data',maxLines: 2,),
                  ) : DatesManager(),
                  datesController.isMay.value ? Center(
                    child: Text('Thank You ....You have Already Entered May Data',maxLines: 2,),
                  ) : DatesManager(),
                  datesController.isJun.value ? Center(
                    child: Text('Thank You ....You have Already Entered Jun Data',maxLines: 2,),
                  ) : DatesManager(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
