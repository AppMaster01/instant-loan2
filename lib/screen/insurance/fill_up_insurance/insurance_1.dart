// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

import '../../get_online_loan/See_all_loans_screen.dart';

class insurance_1 extends StatefulWidget {

  const insurance_1({Key? key}) : super(key: key);

  @override
  State<insurance_1> createState() => _insurance_1State();
}

class _insurance_1State extends State<insurance_1> {
  RxBool form1 = false.obs;

  final FirstName = TextEditingController().obs;

  final LastName = TextEditingController().obs;

  final MiddleName = TextEditingController().obs;

  var abc = Get.arguments;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FirstName.value.dispose();
    LastName.value.dispose();
    MiddleName.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/insurance_1', ''),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controllerAppbar.getappbar('Fill up Form', () {
          backbuttoncontroller.showBackbuttonad(context, '/insurance_1', '');
        }),
        body:
          Stack(
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
                      controllertexfiled.gettextfiled(double.infinity,
                          'First Name', FirstName.value, TextInputType.name),
                      SizedBox(height: ScreenSize.fSize_20()),
                      controllertexfiled.gettextfiled(double.infinity,
                          'Last Name', LastName.value, TextInputType.name),
                      SizedBox(height: ScreenSize.fSize_20()),
                      controllertexfiled.gettextfiled(double.infinity,
                          'Middle  Name', MiddleName.value, TextInputType.name),
                      SizedBox(height: ScreenSize.fSize_50()),
                      controllerContainer.getcontainer(() {
                        if (FirstName.value.text.isEmpty ||
                            LastName.value.text.isEmpty ||
                            MiddleName.value.text.isEmpty) {
                          form1.value = true;
                          Fluttertoast.showToast(
                            msg: "Cannot be empty",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 3,
                            textColor: Colors.white,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.red,
                            fontSize: 15,
                          );
                        } else if (FirstName.value.text.isNotEmpty ||
                            LastName.value.text.isNotEmpty ||
                            MiddleName.value.text.isNotEmpty) {
                          form1.value = false;
                          Data.addAll({
                            "Firstname": FirstName.value.text,
                            "LastName": LastName.value.text,
                          });
                          controller.showbuttonad(
                              context, '/insurance_2', '/insurance_1', '');
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
              banner.getBN('/insurance_1'),
            ],
          ),

      ),
    );
  }
}
