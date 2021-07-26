import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hyhderbad_company_task/constants/constant_button.dart';
import 'package:hyhderbad_company_task/constants/controller.dart';
import 'package:hyhderbad_company_task/constants/text_widget.dart';

class DatesManager extends StatefulWidget {
  // const JANUARY({Key key}) : super(key: key);

  @override
  _DatesManagerState createState() => _DatesManagerState();
}

class _DatesManagerState extends State<DatesManager> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            // Center(
            //   child: customText(Colors.black, 'JANUARY', 20, FontWeight.bold),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customText(Colors.black, 'DATE', 20, FontWeight.bold),
                      customText(Colors.black, 'Enter Value', 20, FontWeight.bold),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText(Colors.black.withOpacity(0.3), '5', 20, FontWeight.normal),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: datesController.date5Controller,
                          style: TextStyle(color: Colors.black),
                          validator: (String value) {
                            if (value.length < 3)
                              return " Enter at least 3 character from Customer Name";
                            else
                              return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // controller: shopNameController,
                          onChanged: (value){
                            print('datesController.date5.value ${ datesController.date5.value}');
                            datesController.date5.value = int.parse(value);
                            print('datesController.date5.value${ datesController.date5.value}');
                          },
                          autofillHints: [AutofillHints.givenName],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: InputBorder.none,
                              hintText:'Date 5' ,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * 0.05,
                              ),
                              // hoverColor: Colors.white,
                              filled: false,
                              fillColor: Colors.white
                            // focusColor: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText(Colors.black.withOpacity(0.3), '10', 20, FontWeight.normal),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),                        border: Border.all(color: Colors.grey.shade400)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: datesController.date10Controller,
                          style: TextStyle(color: Colors.black),
                          validator: (String value) {
                            if (value.length < 3)
                              return " Enter at least 3 character from Customer Name";
                            else
                              return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // controller: shopNameController,
                          onChanged: (value){
                            print('datesController.date10.value${ datesController.date10.value}');
                            datesController.date10.value = int.parse(value);
                            print('datesController.date10.value ${ datesController.date10.value}');
                          },
                          autofillHints: [AutofillHints.givenName],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: InputBorder.none,
                              hintText:'Date 10' ,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * 0.05,
                              ),
                              // hoverColor: Colors.white,
                              filled: false,
                              fillColor: Colors.white
                            // focusColor: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText(Colors.black.withOpacity(0.3), '15', 20, FontWeight.normal),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),                        border: Border.all(color: Colors.grey.shade400)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: datesController.date15Controller,
                          style: TextStyle(color: Colors.black),
                          validator: (String value) {
                            if (value.length < 3)
                              return " Enter at least 3 character from Customer Name";
                            else
                              return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // controller: shopNameController,
                          onChanged: (value){
                            print('datesController.date15.value ${ datesController.date15.value}');
                            datesController.date15.value = int.parse(value);
                            print('stored values after ${ datesController.date15.value}');
                          },
                          autofillHints: [AutofillHints.givenName],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: InputBorder.none,
                              hintText:'Date 15' ,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * 0.05,
                              ),
                              // hoverColor: Colors.white,
                              filled: false,
                              fillColor: Colors.white
                            // focusColor: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText(Colors.black.withOpacity(0.3), '20', 20, FontWeight.normal),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),                        border: Border.all(color: Colors.grey.shade400)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: datesController.date20Controller,
                          style: TextStyle(color: Colors.black),
                          validator: (String value) {
                            if (value.length < 3)
                              return " Enter at least 3 character from Customer Name";
                            else
                              return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // controller: shopNameController,
                          onChanged: (value){
                            print(' datesController.date20.value ${  datesController.date20.value}');
                            datesController.date20.value = int.parse(value);
                            print(' datesController.date20.value${  datesController.date20.value}');
                          },
                          autofillHints: [AutofillHints.givenName],
                          decoration: InputDecoration(
                            // enabledBorder: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: InputBorder.none,
                              hintText:'Date 20' ,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * 0.05,
                              ),
                              // hoverColor: Colors.white,
                              filled: false,
                              fillColor: Colors.white
                            // focusColor: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customText(Colors.black.withOpacity(0.3), '25', 20, FontWeight.normal),
                      Container(
                        height: size.height * 0.07,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),                        border: Border.all(color: Colors.grey.shade400)),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: datesController.date25Controller,
                          style: TextStyle(color: Colors.black),
                          validator: (String value) {
                            if (value.length < 3)
                              return " Enter at least 3 character from Customer Name";
                            else
                              return null;
                          },
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // controller: shopNameController,
                          onChanged: (value){
                            print(' datesController.date25.value ${  datesController.date25.value}');
                            datesController.date25.value = int.parse(value);
                            print('datesController.date25.value ${ datesController.date25.value}');
                          },
                          onEditingComplete: (){
                            // PreviousNextButton(dashboardController,datesController);
                            datesController.validate();
                          },
                          autofillHints: [AutofillHints.givenName],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: InputBorder.none,
                              hintText:'Date 25' ,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * 0.05,
                              ),
                              // hoverColor: Colors.white,
                              filled: false,
                              fillColor: Colors.white
                            // focusColor: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),
            Center(child: PreviousNextButton(dashboardController,datesController)),
          ],
        ),
      ),
    );
  }


}
