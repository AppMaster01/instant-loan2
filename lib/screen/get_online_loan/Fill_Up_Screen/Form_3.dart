// ignore_for_file: constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../get_online_loan/See_all_loans_screen.dart';
import '../Payday_loan_screen.dart';

enum SingingCharacter { Male, Female }

class Form_3 extends StatefulWidget {
  const Form_3({Key? key}) : super(key: key);

  @override
  State<Form_3> createState() => _Form_3State();
}

class _Form_3State extends State<Form_3> {
  final _character = SingingCharacter.Male.obs;

  RxBool form3 = false.obs;

  final BDATE = TextEditingController().obs;

  final EMIAL = TextEditingController().obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BDATE.value.dispose();
    EMIAL.value.dispose();
  }

  static const String KEYNAME = "name";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Form_3', ''),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: controllerAppbar.getappbar('Fill up Form', () {
          backbuttoncontroller.showBackbuttonad(context, '/Form_3', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
                    SizedBox(height: ScreenSize.fSize_40()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_15()),
                        controllerText.getText(
                            'Email Details :',
                            const Color(0xff2F364D),
                            ScreenSize.fSize_20(),
                            FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_25()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter Date of Birth',
                        BDATE.value,
                        TextInputType.datetime),
                    SizedBox(height: ScreenSize.fSize_28()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_13()),
                        controllerText.getText(
                            'Select Gender',
                            const Color(0xff009A73),
                            ScreenSize.fSize_12(),
                            FontWeight.w400),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_6()),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Radio(
                              activeColor: const Color(0xFF009A73),
                              value: SingingCharacter.Male,
                              groupValue: _character.value,
                              onChanged: (value) {
                                _character.value = value!;
                              }),
                        ),
                        controllerText.getText('Male', const Color(0xff2F364D),
                            ScreenSize.fSize_15(), FontWeight.w400),
                        SizedBox(width: ScreenSize.fSize_50()),
                        Transform.scale(
                          scale: 1.2,
                          child: Radio(
                              activeColor: const Color(0xFF009A73),
                              value: SingingCharacter.Female,
                              groupValue: _character.value,
                              onChanged: (value) {
                                _character.value = value!;
                              }),
                        ),
                        Text(
                          'Female',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenSize.fSize_16()),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_12()),
                    controllertexfiled.gettextfiled(
                        double.infinity,
                        'Enter Email Address',
                        EMIAL.value,
                        TextInputType.emailAddress),
                    SizedBox(height: ScreenSize.fSize_40()),
                    controllerContainer.getcontainer(() async {
                      if (BDATE.value.text.isEmpty ||
                          EMIAL.value.text.isEmpty) {
                        form3.value = true;
                        Fluttertoast.showToast(
                          msg: "Cannot be empty",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.red,
                          fontSize: 15,
                        );
                      } else if (BDATE.value.text.isNotEmpty ||
                          EMIAL.value.text.isNotEmpty) {
                        form3.value = false;
                        Data.addAll({
                          "EMIAL": EMIAL.value.text,
                        });
                        controller.showbuttonad(
                            context, '/Payday_loan_screen', '/Form_3', '');
                      }
                      var prefs = await SharedPreferences.getInstance();
                      var userData = Data.values;
                      // userData.add(Data);
                      prefs.setString(KEYNAME, userData.toString());
                      // var getname = prefs.getString(KEYNAME);
                      // user = await json.decode(getname.toString());
                      // shared();
                      Counter.value = 6;
                      prefs.setInt('counter', Counter.value);
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
            ),
            banner.getBN('/Form_3'),
          ],
        ),
      ),
    );
  }
}
