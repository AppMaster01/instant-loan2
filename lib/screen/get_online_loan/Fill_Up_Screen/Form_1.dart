// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../get_online_loan/See_all_loans_screen.dart';
import '../Payday_loan_screen.dart';

class Form_1 extends StatefulWidget {
  const Form_1({Key? key}) : super(key: key);

  @override
  State<Form_1> createState() => _Form_1State();
}

class _Form_1State extends State<Form_1> {
  RxBool form1 = false.obs;
  static const String KEYNAME = "name";

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
          backbuttoncontroller.showBackbuttonad(context, '/Form_1', ''),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controllerAppbar.getappbar('Fill up Form', () {
          backbuttoncontroller.showBackbuttonad(context, '/Form_1', '');
        }),
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
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
                    controllerContainer.getcontainer(() async {
                      Data.addAll({
                        "Firstname": FirstName.value.text,
                        "LastName": LastName.value.text,
                      });
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

                        controller.showbuttonad(
                            context, '/Payday_loan_screen', '/Form_1', '');
                      }

                      var prefs = await SharedPreferences.getInstance();
                      var userData = Data.values;
                      // userData.add(Data);
                      prefs.setString(KEYNAME, userData.toString());
                      Counter.value = 4;
                      prefs.setInt('counter', Counter.value);

                      // var getname = prefs.getString(KEYNAME);
                      // user = await json.decode(getname.toString());
                      // shared();
                    },
                        const Color(0xff009A73),
                        Center(
                          child: controllerText.getText('Submit', Colors.white,
                              ScreenSize.fSize_15(), FontWeight.w700),
                        )),
                    SizedBox(height: ScreenSize.fSize_70()),
                  ],
                ),
              ),
              banner.getBN('/Form_1'),
            ],
          ),
        ),
      ),
    );
  }
}
