
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Payday_loan_screen.dart';

var LoanAmount = 5000.0.obs;
var LoanRate = 5.0.obs;
var LoanDuration = 5.0.obs;

class Select_loan_amount_screen extends StatefulWidget {
  const Select_loan_amount_screen({Key? key}) : super(key: key);

  @override
  State<Select_loan_amount_screen> createState() =>
      _Select_loan_amount_screenState();
}

class _Select_loan_amount_screenState extends State<Select_loan_amount_screen> {
  var abc = Get.arguments;
  String KEYNAME = "name";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/Select_loan_amount_screen', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('', () {
          backbuttoncontroller.showBackbuttonad(
              context, '/Select_loan_amount_screen', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_14()),
                        controllerText.getText('Loan Amount', const Color(0xff009A73),
                            ScreenSize.fSize_15(), FontWeight.w800),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: controllerwhite.getselect(
                          ScreenSize.fSize_60(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerText.getText(
                                  '\$${LoanAmount.value.round().toString()}',
                                  const Color(0xff2F364D),
                                  ScreenSize.fSize_25(),
                                  FontWeight.w700),
                            ],
                          )),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                          trackShape: RoundedRectSliderTrackShape(),
                          thumbShape: RoundSliderThumbShape(
                              elevation: 0, enabledThumbRadius: 8)),
                      child: Slider(
                        activeColor: const Color(0xff009A73),
                        inactiveColor: const Color(0xffE2E6EA),
                        min: 0,
                        max: 100000,
                        value: LoanAmount.value,
                        onChanged: (value) {
                          LoanAmount.value = value;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllerText.getText('\$${1000}', const Color(0xff2F364D),
                            ScreenSize.fSize_14(), FontWeight.w700),
                        SizedBox(width: ScreenSize.horizontalBlockSize! * 50),
                        controllerText.getText('\$${100000}', const Color(0xff2F364D),
                            ScreenSize.fSize_14(), FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_40()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_14()),
                        controllerText.getText(
                            'Loan Duration',
                            const Color(0xff2F364D),
                            ScreenSize.fSize_13(),
                            FontWeight.w400),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showMaterialNumberPicker(
                            context: context,
                            title: 'Loan Duration',
                            headerColor: const Color(0xff2F364D),
                            headerTextColor: Colors.white,
                            backgroundColor: Colors.white,
                            buttonTextColor: const Color(0xff2F364D),
                            maxShortSide: ScreenSize.horizontalBlockSize! * 50,
                            maxLongSide: ScreenSize.horizontalBlockSize! * 100,
                            maxNumber: 36,
                            minNumber: 4,
                            selectedNumber: LoanDuration.value.round(),
                            onChanged: (value) =>
                                LoanDuration.value = value.roundToDouble());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: ScreenSize.fSize_70(),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffF1FCF9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              controllerText.getText(
                                  '${LoanDuration.value.round().toString()} Months',
                                  const Color(0xff2F364D),
                                  ScreenSize.fSize_18(),
                                  FontWeight.w700),
                              SizedBox(
                                  width: ScreenSize.horizontalBlockSize! * 28),
                              Center(
                                child: Image(
                                  image: const AssetImage(
                                      'asset/image/icons/dropdown1.png'),
                                  height: ScreenSize.fSize_23(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_10()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_14()),
                        controllerText.getText(
                            'Interest Rate',
                            const Color(0xff2F364D),
                            ScreenSize.fSize_13(),
                            FontWeight.w400),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showMaterialNumberPicker(
                            context: context,
                            title: 'Loan Rate',
                            headerColor: const Color(0xff2F364D),
                            headerTextColor: Colors.white,
                            backgroundColor: Colors.white,
                            buttonTextColor: const Color(0xff2F364D),
                            maxLongSide: ScreenSize.horizontalBlockSize! * 100,
                            maxNumber: 18,
                            minNumber: 3,
                            selectedNumber: LoanRate.value.round(),
                            onChanged: (value) =>
                                LoanRate.value = value.roundToDouble());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: ScreenSize.fSize_70(),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffF1FCF9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              controllerText.getText(
                                  '${LoanRate.value.round().toString()}% APY',
                                  const Color(0xff2F364D),
                                  ScreenSize.fSize_18(),
                                  FontWeight.w700),
                              SizedBox(
                                  width: ScreenSize.horizontalBlockSize! * 28),
                              Center(
                                child: Image(
                                  image: const AssetImage(
                                      'asset/image/icons/dropdown1.png'),
                                  height: ScreenSize.fSize_23(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_70()),
                    controllerContainer.getcontainer(() async {
                      Counter.value = 1;
                      // if (Counter.value == 1) {
                      //   return
                      backbuttoncontroller.showBackbuttonad(
                          context, '/Select_loan_amount_screen', '');
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt('counter', Counter.value);
                      // } else {}
                      // log('/Select_loan_amount_screen${Counter.value}');
                    },
                        const Color(0xff009A73),
                        Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.almarai(
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenSize.fSize_15(),
                                color: Colors.white),
                          ),
                        )),
                    SizedBox(height: ScreenSize.fSize_70()),
                  ],
                ),
              ),
            ),
            banner.getBN('/Select_loan_amount_screen')
          ],
        ),
      ),
    );
  }
}
