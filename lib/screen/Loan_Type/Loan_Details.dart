// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

class Loan_Details extends StatefulWidget {
  const Loan_Details({Key? key}) : super(key: key);

  @override
  State<Loan_Details> createState() => _Loan_DetailsState();
}

class _Loan_DetailsState extends State<Loan_Details> {
  var abc = Get.arguments;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Details', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('Loan Details', () {
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Details', '');

        }),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.maxFinite,
                height: ScreenSize.horizontalBlockSize! * 80,
                decoration: BoxDecoration(
                    color: abc,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_40()),
                    controllerText.getText(
                        'How Do Loans Work?',
                        const Color(0xff2F364D),
                        ScreenSize.fSize_25(),
                        FontWeight.w700),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: controllerText.getText("""
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
                          const Color(0xff2F364D),
                          ScreenSize.fSize_14(),
                          FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN('/Loan_Details')
          ],
        ),
      ),
    );
  }
}
