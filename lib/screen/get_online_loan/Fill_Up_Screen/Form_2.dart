// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Payday_loan_screen.dart';

class Form_2 extends StatefulWidget {
  const Form_2({Key? key}) : super(key: key);

  @override
  State<Form_2> createState() => _Form_2State();
}

class _Form_2State extends State<Form_2> {
  RxBool form2 = false.obs;
  final ADDS = TextEditingController().obs;
  final STATE = TextEditingController().obs;
  final ZIP = TextEditingController().obs;
  final CITY = TextEditingController().obs;
  final County = TextEditingController().obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ADDS.value.dispose();
    STATE.value.dispose();
    ZIP.value.dispose();
    CITY.value.dispose();
    County.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Form_2', ''),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controllerAppbar.getappbar('Fill up Form', () {
          backbuttoncontroller.showBackbuttonad(context, '/Form_2', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_15()),
                        controllerText.getText(
                            'Address Details :',
                            const Color(0xff2F364D),
                            ScreenSize.fSize_20(),
                            FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_28()),
                    controllertexfiled.gettextfiled(double.infinity,
                        'Enter Address', ADDS.value, TextInputType.name),
                    SizedBox(height: ScreenSize.fSize_20()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter State / Province',
                        STATE.value,
                        TextInputType.name),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenSize.fSize_170()),
                          child: controllertexfiled.gettextfiled(
                              ScreenSize.fSize_160(),
                              'Enter City',
                              CITY.value,
                              TextInputType.name),
                        ),
                        controllertexfiled.gettextfiled(ScreenSize.fSize_160(),
                            'Enter Zipcode', ZIP.value, TextInputType.number),
                      ],
                    ),
                    controllertexfiled.gettextfiled(double.infinity,
                        'Enter County', County.value, TextInputType.name),
                    SizedBox(height: ScreenSize.fSize_40()),
                    controllerContainer.getcontainer(() async {
                      if (ADDS.value.text.isEmpty ||
                          STATE.value.text.isEmpty ||
                          ZIP.value.text.isEmpty ||
                          CITY.value.text.isEmpty ||
                          County.value.text.isEmpty) {
                        form2.value = true;
                        Fluttertoast.showToast(
                          msg: "Cannot be empty",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.red,
                          fontSize: 15,
                        );
                      } else if (ADDS.value.text.isNotEmpty ||
                          STATE.value.text.isNotEmpty ||
                          ZIP.value.text.isNotEmpty ||
                          CITY.value.text.isEmpty ||
                          County.value.text.isEmpty) {
                        form2.value = false;
                        controller.showbuttonad(
                            context, '/Payday_loan_screen', '/Form_2', '');
                      }
                      Counter.value = 5;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt('counter', Counter.value);
                    },
                        const Color(0xff009A73),
                        Center(
                          child: controllerText.getText('Submit', Colors.white,
                              ScreenSize.fSize_15(), FontWeight.w700),
                        )),
                    SizedBox(height: ScreenSize.fSize_100()),
                  ],
                ),
              ),
            ),
            banner.getBN('/Form_2'),
          ],
        ),
      ),
    );
  }
}
