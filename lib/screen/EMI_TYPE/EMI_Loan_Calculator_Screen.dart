// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../get_online_loan/Payday_loan_screen.dart';

var amount = 1000.0.obs;
var duration = 5.0.obs;
var rate = 5.0.obs;
var emiresult = 0.0.obs;

class EMI_Loan_Calculator_Screen extends StatefulWidget {
  const EMI_Loan_Calculator_Screen({Key? key}) : super(key: key);

  @override
  State<EMI_Loan_Calculator_Screen> createState() =>
      _EMI_Loan_Calculator_ScreenState();
}

class _EMI_Loan_Calculator_ScreenState
    extends State<EMI_Loan_Calculator_Screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/EMI_Loan_Calculator_Screen', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('EMI Loan Calculator', () {
          controller.showbuttonad(context, '/Payday_loan_screen',
              '/EMI_Loan_Calculator_Screen', '');
        }),
        body:
           Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  () => Column(
                    children: [
                      controllerslider.getslider(
                          "Loan Amount",
                          ScreenSize.horizontalBlockSize! * 40,
                          amount.value, (value) {
                        amount.value = value;
                      }, '\$${1000}', '\$${100000}',
                          '\$${amount.value.round().toString()}', 100000),
                      controllerslider.getslider(
                          'Loan Duration',
                          ScreenSize.horizontalBlockSize! * 40,
                          duration.value, (value) {
                        duration.value = value;
                      }, '${1}Months', '${36}Months',
                          '${duration.value.round().toString()} Months', 36),
                      controllerslider.getslider(
                          'Interest Rate',
                          ScreenSize.horizontalBlockSize! * 40,
                          rate.value, (value) {
                        rate.value = value;
                      }, '${1}%', '${18}%', '${rate.value.round().toString()}%',
                          18),
                      SizedBox(height: ScreenSize.fSize_40()),
                      controllerContainer.getcontainer(() async {
                        double RATE = rate.value.round() / 12 / 100;
                        double emi = amount.value.round() *
                            RATE *
                            (pow(1 + RATE, duration.value.round()) /
                                (pow(1 + RATE, duration.value.round()) - 1));
                        emiresult.value = emi;
                        Counter.value = 3;
                        controller.showbuttonad(context, '/Your_EMI',
                            '/EMI_Loan_Calculator_Screen', '');
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('counter', Counter.value);
                      },
                          const Color(0xff009A73),
                          Center(
                            child: controllerText.getText(
                                'Calculate',
                                Colors.white,
                                ScreenSize.fSize_18(),
                                FontWeight.w700),
                          )),
                    ],
                  ),
                ),
              ),
              banner.getBN('/EMI_Loan_Calculator_Screen')
            ],
          ),

      ),
    );
  }
}
