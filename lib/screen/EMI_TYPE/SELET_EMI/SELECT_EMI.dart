import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/SELET_EMI/select_your_emi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../get_online_loan/Payday_loan_screen.dart';


class EMI_Loan_Calculator_Screen2 extends StatefulWidget {
  const EMI_Loan_Calculator_Screen2({Key? key}) : super(key: key);

  @override
  State<EMI_Loan_Calculator_Screen2> createState() =>
      _EMI_Loan_Calculator_Screen2State();
}

class _EMI_Loan_Calculator_Screen2State
    extends State<EMI_Loan_Calculator_Screen2> {
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
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    controllerslider.getslider(
                        "Loan Amount",
                        ScreenSize.horizontalBlockSize! * 40,
                        LOANAMOUNT.value, (value) {
                      LOANAMOUNT.value = value;
                    }, '\$${1000}', '\$${100000}',
                        '\$${LOANAMOUNT.value.round().toString()}', 100000),
                    controllerslider.getslider(
                        'Loan Duration',
                        ScreenSize.horizontalBlockSize! * 40,
                        LOANTIME.value, (value) {
                      LOANTIME.value = value;
                    }, '${1}Months', '${36}Months',
                        '${LOANTIME.value.round().toString()} Months', 36),
                    controllerslider.getslider(
                        'Interest Rate',
                        ScreenSize.horizontalBlockSize! * 40,
                        LOANRATE.value, (value) {
                      LOANRATE.value = value;
                    }, '${1}%', '${18}%',
                        '${LOANRATE.value.round().toString()}%', 18),
                    SizedBox(height: ScreenSize.fSize_40()),
                    controllerContainer.getcontainer(() async {
                      double RATE = LOANRATE.value.round() / 12 / 100;
                      double emi = LOANAMOUNT.value.round() *
                          RATE *
                          (pow(1 + RATE, LOANTIME.value.round()) /
                              (pow(1 + RATE, LOANTIME.value.round()) - 1));
                      LOANEMIRESULT.value = emi;
                      controller.showbuttonad(context, '/Your_EMI2',
                          '/EMI_Loan_Calculator_Screen', '');
                    },
                        Color(0xff009A73),
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
