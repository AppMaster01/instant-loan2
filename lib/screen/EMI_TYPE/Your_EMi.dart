// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/EMI_Loan_Calculator_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../get_online_loan/Payday_loan_screen.dart';

class Your_EMI extends StatefulWidget {
  const Your_EMI({Key? key}) : super(key: key);

  @override
  State<Your_EMI> createState() => _Your_EMIState();
}

class _Your_EMIState extends State<Your_EMI> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Your_EMI', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('Your EMI', () {
          backbuttoncontroller.showBackbuttonad(context, '/Your_EMI', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          width: double.maxFinite,
                          height: ScreenSize.fSize_160(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              border: Border.all(
                                  color: const Color(0xffE2E6EA), width: 1)),
                          child: Column(
                            children: [
                              SizedBox(height: ScreenSize.fSize_15()),
                              controllerText.getText('EMI', const Color(0xff141414),
                                  ScreenSize.fSize_14(), FontWeight.w700),
                              SizedBox(height: ScreenSize.fSize_34()),
                              controllerText.getText(
                                  '${duration.value.round().toString()} Months',
                                  const Color(0xff141414),
                                  ScreenSize.fSize_13(),
                                  FontWeight.w500),
                              SizedBox(height: ScreenSize.fSize_20()),
                              controllerText.getText(
                                  emiresult.value.round().toString(),
                                  const Color(0xff009A73),
                                  ScreenSize.fSize_30(),
                                  FontWeight.w700),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              border: Border.all(
                                  color: const Color(0xffE2E6EA), width: 1)),
                          child: Column(
                            children: [
                              SizedBox(height: ScreenSize.fSize_30()),
                              controllerText.getText(
                                  'Total Payment',
                                  Colors.black,
                                  ScreenSize.fSize_14(),
                                  FontWeight.w700),
                              SizedBox(height: ScreenSize.fSize_20()),
                              controllerText.getText(
                                  NumberFormat.simpleCurrency(
                                          decimalDigits: 0, name: '')
                                      .format((emiresult.value *
                                              duration.value.roundToDouble())
                                          .round()),
                                  const Color(0xff009A73),
                                  ScreenSize.fSize_25(),
                                  FontWeight.w700),
                              SizedBox(height: ScreenSize.fSize_25()),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                      trackHeight: 8,
                                      inactiveTrackColor: const Color(0xFF854ECA),
                                      activeTrackColor: const Color(0xFFE86F00),
                                      thumbColor: Colors.transparent,
                                      thumbShape: const RoundSliderThumbShape(
                                          elevation: 0,
                                          disabledThumbRadius: 0,
                                          pressedElevation: 0,
                                          enabledThumbRadius: 0)),
                                  child: Slider(
                                    value: amount.value,
                                    max: (emiresult.value *
                                        duration.value.roundToDouble()),
                                    min: 0,
                                    onChanged: (double value) {},
                                  ),
                                ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: ScreenSize.fSize_3()),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFE86F00),
                                    minRadius:
                                        ScreenSize.horizontalBlockSize! * 1.5,
                                  ),
                                  Column(
                                    children: [
                                      controllerText.getText(
                                          'Total Principal',
                                          Colors.black,
                                          ScreenSize.fSize_12(),
                                          FontWeight.w400),
                                      SizedBox(height: ScreenSize.fSize_8()),
                                      controllerText.getText(
                                          NumberFormat.simpleCurrency(
                                                  decimalDigits: 0, name: '')
                                              .format(
                                                  amount.value.roundToDouble()),
                                          Colors.black,
                                          ScreenSize.fSize_16(),
                                          FontWeight.w700),
                                    ],
                                  ),
                                  SizedBox(
                                      width:
                                          ScreenSize.horizontalBlockSize! * 7),
                                  Column(
                                    children: [
                                      controllerText.getText(
                                          'Total Interest',
                                          Colors.black,
                                          ScreenSize.fSize_12(),
                                          FontWeight.w400),
                                      SizedBox(height: ScreenSize.fSize_8()),
                                      controllerText.getText(
                                          NumberFormat.simpleCurrency(
                                                  decimalDigits: 0, name: '')
                                              .format((emiresult.value *
                                                      duration.value
                                                          .roundToDouble() -
                                                  amount.value
                                                      .roundToDouble())),
                                          Colors.black,
                                          ScreenSize.fSize_16(),
                                          FontWeight.w700),
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFF854ECA),
                                    minRadius:
                                        ScreenSize.horizontalBlockSize! * 1.5,
                                  ),
                                  SizedBox(width: ScreenSize.fSize_3()),
                                ],
                              ),
                              SizedBox(height: ScreenSize.fSize_20()),
                            ],
                          )),
                    ),
                    SizedBox(height: ScreenSize.fSize_50()),
                    controllerContainer.getcontainer(() async {
                      Counter.value = 3;
                      controller.showbuttonad(
                          context, '/Payday_loan_screen', '/Your_EMI', '');
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt('counter', Counter.value);
                    },
                        const Color(0xff009A73),
                        Center(
                          child: Text('Submit',
                              style: GoogleFonts.almarai(
                                  color: Colors.white,
                                  fontSize: ScreenSize.fSize_18(),
                                  fontWeight: FontWeight.w700)),
                        ))
                  ],
                ),
              ),
            ),
            banner.getBN('/Your_EMI')
          ],
        ),
      ),
    );
  }
}
