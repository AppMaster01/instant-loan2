// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, unnecessary_string_interpolations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:loan_instant_2/screen/get_online_loan/Select_loan_amount_screen.dart';
import 'package:loan_instant_2/screen/get_online_loan/see_loans_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'Payday_loan_screen.dart';

String emicalculate(int index) {
  double rate = (LoanRate.value.round() + rates[index]) / 12 / 100;
  double Install = (LoanAmount.value.round() + lonaamount[index]) *
      rate *
      (pow(1 + rate, (LoanDuration.value.round() + Loanterm[index])) /
          (pow(1 + rate, (LoanDuration.value.round() + Loanterm[index])) - 1));
  return Install.round().toString();
}

Map Data = {};

class See_all_loans_screen extends StatefulWidget {
  const See_all_loans_screen({Key? key}) : super(key: key);

  @override
  State<See_all_loans_screen> createState() => _See_all_loans_screenState();
}

class _See_all_loans_screenState extends State<See_all_loans_screen> {
  var KEYNAME = "name".obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller
          .showBackbuttonad(context, '/See_all_loans_screen', {
        "amount": LoanAmount.value.round() + lonaamount[index],
        "rate": LoanRate.value.round() + rates[index],
        "duration": LoanDuration.value.round() + Loanterm[index],
        "calcu": emicalculate(index),
        "fee": fee[index]
      }),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('All Loans', () {
          backbuttoncontroller
              .showBackbuttonad(context, '/See_all_loans_screen', {
            "amount": LoanAmount.value.round() + lonaamount[index],
            "rate": LoanRate.value.round() + rates[index],
            "duration": LoanDuration.value.round() + Loanterm[index],
            "calcu": emicalculate(index),
            "fee": fee[index]
          });
        }),
        body: Obx(
          () =>  Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lonaamount.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            Data.addAll({
                              """amount""":
                                  '${LoanAmount.value.round() + lonaamount[index]}',
                              "rate": '${LoanRate.value.round() + rates[index]}',
                              "duration":
                                  '${LoanDuration.value.round() + Loanterm[index]}',
                              "calcu": '${emicalculate(index)}',
                              "fee": "${fee[index]}",
                            });
                            Counter.value = 2;
                            // if (Counter.value == 2) {
                            //   print('/See_all_loans_screen${Counter.value}');
                            controller.showbuttonad(
                                context,
                                '/Payday_loan_screen',
                                '/See_all_loans_screen',
                                Data);
                            // } else {}
                            var prefs = await SharedPreferences.getInstance();
                            var userData = Data.values;
                            // userData.add(Data);
                            prefs.setString(KEYNAME.value, Data.toString());
                            prefs.setInt('counter', Counter.value);
                            var getname = prefs.getString(KEYNAME.value);
                            // var getname = prefs.getString(KEYNAME);
                            // user = await json.decode(getname.toString());
                            // // shared();
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        border:
                                            Border.all(color: const Color(0xffE2E6EA))),
                                    child: Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_15()),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: ScreenSize.fSize_20()),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                controllerText.getText(
                                                    'Amount',
                                                    const Color(0xff009A73),
                                                    ScreenSize.fSize_15(),
                                                    FontWeight.w400),
                                                controllerText.getText(
                                                    "\$${LoanAmount.value.round() + lonaamount[index]}",
                                                    const Color(0xff2F364D),
                                                    ScreenSize.fSize_16(),
                                                    FontWeight.w700)
                                              ],
                                            ),
                                            SizedBox(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    35),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: ScreenSize.fSize_23()),
                                                controllerText.getText(
                                                    'Monthly Instalment',
                                                    const Color(0xff009A73),
                                                    ScreenSize.fSize_15(),
                                                    FontWeight.w400),
                                                controllerText.getText(
                                                    '\$${emicalculate(index)}',
                                                    const Color(0xff2F364D),
                                                    ScreenSize.fSize_16(),
                                                    FontWeight.w700)
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: ScreenSize.fSize_30()),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: ScreenSize.fSize_20()),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                controllerText.getText(
                                                    'Rate',
                                                    const Color(0xff009A73),
                                                    ScreenSize.fSize_15(),
                                                    FontWeight.w400),
                                                Container(
                                                  height: ScreenSize.fSize_20(),
                                                  width: ScreenSize.fSize_70(),
                                                  child: controllerText.getText(
                                                      "${LoanRate.value.round() + rates[index]}% p.a.",
                                                      const Color(0xff2F364D),
                                                      ScreenSize.fSize_16(),
                                                      FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    30),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                controllerText.getText(
                                                    'Duration',
                                                    const Color(0xff009A73),
                                                    ScreenSize.fSize_15(),
                                                    FontWeight.w400),
                                                controllerText.getText(
                                                    "${LoanDuration.value.round() + Loanterm[index]} Months",
                                                    const Color(0xff2F364D),
                                                    ScreenSize.fSize_16(),
                                                    FontWeight.w700)
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: ScreenSize.fSize_15()),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: ScreenSize.fSize_6()),
                                      Container(
                                        height: ScreenSize.fSize_80(),
                                        width: ScreenSize.fSize_80(),
                                        child: SfRadialGauge(
                                            animationDuration: 1800,
                                            enableLoadingAnimation: true,
                                            axes: <RadialAxis>[
                                              RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                showLabels: false,
                                                showTicks: false,
                                                startAngle: 270,
                                                endAngle: 270,
                                                radiusFactor: 0.75,
                                                axisLineStyle: const AxisLineStyle(
                                                  thickness: 0.2,
                                                  color: Color(0xFFD6E7E2),
                                                  thicknessUnit:
                                                      GaugeSizeUnit.factor,
                                                ),
                                                annotations: [
                                                  GaugeAnnotation(
                                                    widget: Row(
                                                      children: [
                                                        SizedBox(
                                                            width: ScreenSize
                                                                    .horizontalBlockSize! *
                                                                7.5),
                                                        Center(
                                                          child: Text(
                                                              '${Average[index].round()}%',
                                                              style: GoogleFonts
                                                                  .almarai(
                                                                fontSize: ScreenSize
                                                                    .fSize_15(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                                pointers: <GaugePointer>[
                                                  RangePointer(
                                                    value: Average[index],
                                                    width: 0.17,
                                                    enableDragging: true,
                                                    cornerStyle:
                                                        CornerStyle.bothCurve,
                                                    pointerOffset: 0.01,
                                                    color: const Color(0xFF009A73),
                                                    sizeUnit:
                                                        GaugeSizeUnit.factor,
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                      SizedBox(width: ScreenSize.fSize_30()),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenSize.fSize_15()),
                                        child: Container(
                                          height: ScreenSize.fSize_60(),
                                          width: ScreenSize.horizontalBlockSize! *
                                              62,
                                          decoration: const BoxDecoration(
                                              color: Color(0xffF1FCF9),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topRight: Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Center(
                                                  child: Image(
                                                image: const AssetImage(
                                                    'asset/image/icons/Group 194.png'),
                                                width: ScreenSize.fSize_25(),
                                              )),
                                              SizedBox(
                                                  width: ScreenSize.fSize_20()),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          ScreenSize.fSize_6()),
                                                  controllerText.getText(
                                                      avrage[index],
                                                      Colors.black,
                                                      ScreenSize.fSize_12(),
                                                      FontWeight.w500),
                                                  SizedBox(
                                                      height:
                                                          ScreenSize.fSize_4()),
                                                  controllerText.getText(
                                                      """Entirely online process and
quick approval""", Colors.black, ScreenSize.fSize_12(), FontWeight.w500),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    height: ScreenSize.fSize_34(),
                                    color: const Color(0xff009A73),
                                    thickness: 2,
                                    indent: ScreenSize.fSize_10(),
                                    endIndent: ScreenSize.fSize_10(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return index == 5
                            ? native.getNT(context, '/See_all_loans_screen',
                                'listTileMedium')
                            : Container();
                      },
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
              banner.getBN('/See_all_loans_screen')
            ],
          ),
        ),
      ),
    );
  }
}
