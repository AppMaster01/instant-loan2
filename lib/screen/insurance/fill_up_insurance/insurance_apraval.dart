// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

class insurance_approved_Screen extends StatelessWidget {
  const insurance_approved_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/Loan_approved_Screen', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('Congratulations', () {
          backbuttoncontroller.showBackbuttonad(
              context, '/Loan_approved_Screen', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  native.getNT(
                      context, '/Loan_approved_Screen', 'listTileMedium'),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          border: Border.all(color: const Color(0xffE2E6EA))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: ScreenSize.fSize_20()),
                          GestureDetector(
                            child: Column(
                              children: [
                                controllerText.getText(
                                    'Great!!',
                                    const Color(0xff2F364D),
                                    ScreenSize.fSize_20(),
                                    FontWeight.w700)
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image:
                                const AssetImage('asset/image/icons/Vector.png'),
                                height: ScreenSize.fSize_60()),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text("""Your request has been
                       approved""",
                              style: GoogleFonts.almarai(
                                  fontSize: ScreenSize.fSize_18(),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff009A73))),
                          SizedBox(height: ScreenSize.fSize_30()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: ScreenSize.horizontalBlockSize! * 80,
                                height: ScreenSize.horizontalBlockSize! * 13,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    """We need 48 hours for review your application and we will contact you in 48 hours.""",
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.almarai(
                                        fontSize: ScreenSize.fSize_13(),
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  controllerContainer.getcontainer(() {
                    controller.showbuttonad(
                        context, '/Home_Screen', '/GetStart', 'arg');
                  },
                      const Color(0xff009A73),
                      Center(
                        child: Text(
                          'Home',
                          style: GoogleFonts.almarai(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenSize.fSize_16()),
                        ),
                      )),
                  SizedBox(height: ScreenSize.fSize_120()),
                ],
              ),
            ),
            banner.getBN('/Loan_approved_Screen')
          ],
        ),
      ),
    );
  }
}
