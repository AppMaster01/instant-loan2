// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:loan_instant_2/screen/Loan_Type/Loantype_model.dart';

class Loan_Type extends StatefulWidget {
  const Loan_Type({Key? key}) : super(key: key);

  @override
  State<Loan_Type> createState() => _Loan_TypeState();
}

class _Loan_TypeState extends State<Loan_Type> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Type', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('Loan Type', () {
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Type', '');
        }),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ScreenSize.fSize_40()),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: ContainColor.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return controllerColorContain22.getcontainer22(() {
                        controller.showbuttonad(context, '/Loan_Details',
                            '/Loan_Type', RtangleColor[index]);
                      },
                          ScreenSize.horizontalBlockSize! * 46,
                          ContainColor[index],
                          RtangleColor[index],
                          images[index],
                          title[index],
                          titlecolor[index]);
                    },
                  ),
                ),
              ),
            ),
            banner.getBN('/Loan_Type'),
          ],
        ),
      ),
    );
  }
}
