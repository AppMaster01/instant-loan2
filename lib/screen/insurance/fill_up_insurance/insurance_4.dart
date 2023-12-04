// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

class insurance_4 extends StatefulWidget {
  const insurance_4({Key? key}) : super(key: key);

  @override
  State<insurance_4> createState() => _insurance_4State();
}

class _insurance_4State extends State<insurance_4> {
  final number = TextEditingController().obs;
  final Account = TextEditingController().obs;
  final Salary = TextEditingController().obs;
  RxBool form4 = false.obs;
  var abc = Get.arguments;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    number.value.dispose();
    Account.value.dispose();
    Salary.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/insurance_4', abc),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controllerAppbar.getappbar('Fill up Form', () {
          backbuttoncontroller.showBackbuttonad(context, '/insurance_4', abc);
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_40()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_15()),
                        controllerText.getText(
                            'Personal Details :',
                            const Color(0xff2F364D),
                            ScreenSize.fSize_20(),
                            FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_28()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter Phone Number',
                        number.value,
                        TextInputType.number),
                    SizedBox(height: ScreenSize.fSize_20()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter Account Number',
                        Account.value,
                        TextInputType.number),
                    SizedBox(height: ScreenSize.fSize_20()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter Salary Amount',
                        Salary.value,
                        TextInputType.number),
                    SizedBox(height: ScreenSize.fSize_20()),
                    controllerContainer.getcontainer(() {
                      if (number.value.text.isEmpty ||
                          Account.value.text.isEmpty ||
                          Salary.value.text.isEmpty) {
                        form4.value = true;
                        Fluttertoast.showToast(
                          msg: "Cannot be empty",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.red,
                          fontSize: 15,
                        );
                      } else if (number.value.text.isNotEmpty ||
                          Account.value.text.isNotEmpty ||
                          Salary.value.text.isNotEmpty) {
                        form4.value = false;
                        controller.showbuttonad(context,
                            '/insurance_approved_Screen', '/insurance_4', abc);
                      }
                    },
                        const Color(0xff009A73),
                        Center(
                          child: controllerText.getText('Next', Colors.white,
                              ScreenSize.fSize_15(), FontWeight.w700),
                        )),
                    SizedBox(height: ScreenSize.fSize_70()),
                  ],
                ),
              ),
            ),
            banner.getBN('/insurance_4'),
          ],
        ),
      ),
    );
  }
}
