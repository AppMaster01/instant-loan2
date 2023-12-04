// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:url_launcher/url_launcher.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Scaffold _buildExitDialog(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Image(
                image: const AssetImage('asset/image/Vector Img2.png'),
                height: ScreenSize.horizontalBlockSize! * 78,
              )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      border: Border.all(color: const Color(0xffE2E6EA))),
                  child: Column(children: [
                    SizedBox(height: ScreenSize.fSize_34()),
                    controllerText.getText("EXIT", const Color(0xff009A73),
                        ScreenSize.fSize_23(), FontWeight.w700),
                    SizedBox(height: ScreenSize.fSize_34()),
                    controllerText.getText('Do You Want to Exit?', Colors.black,
                        ScreenSize.fSize_14(), FontWeight.w400),
                    SizedBox(height: ScreenSize.fSize_34()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllerEXIT.getEXIT(() => SystemNavigator.pop(),
                            const Color(0xff009A73), 'Yes', Colors.white),
                        controllerEXIT.getEXIT(
                            () => Navigator.of(context).pop(false),
                            const Color(0xffF1FCF9),
                            "No",
                            Colors.black),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_34()),
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_25()),
                  native.getNT(context, '/Home_Screen', 'listTileMedium '),
                  SizedBox(height: ScreenSize.fSize_30()),
                  Image(
                    image: const AssetImage('asset/image/Vector Img1.png'),
                    width: ScreenSize.horizontalBlockSize! * 65,
                  ),
                  SizedBox(height: ScreenSize.fSize_45()),
                  controllerContainer.getcontainer(() {
                    controller.showbuttonad(
                        context, '/Home_Screen', '/GetStart', '');
                  },
                      const Color(0xff009A73),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Center(
                                  child: Image(
                                image: const AssetImage(
                                    'asset/image/icons/Start.png'),
                                width: ScreenSize.fSize_23(),
                              )),
                            ),
                          ),
                          Text(
                            'Get Started',
                            style: GoogleFonts.almarai(
                                color: Colors.white,
                                fontSize: ScreenSize.fSize_18(),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: ScreenSize.fSize_3()),
                        ],
                      )),
                  SizedBox(height: ScreenSize.fSize_20()),
                  GestureDetector(
                    onTap: () {
                      controller.showbuttonad(
                          context, '/Loan_Work', '/GetStart', '');
                    },
                    child: Container(
                        width: ScreenSize.fSize_180(),
                        height: ScreenSize.fSize_45(),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            border: Border.all(color: const Color(0xffE2E6EA))),
                        child: Center(
                          child: Text(
                            'How Loan Work?',
                            style: GoogleFonts.almarai(
                                color: const Color(0xff009A73),
                                fontSize: ScreenSize.fSize_17(),
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  SizedBox(height: ScreenSize.fSize_50()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      controllershare.getshare(
                            _shareURL, 'asset/image/icons/share.png', 'Share'),
                      controllershare.getshare(
                          _shareURL, 'asset/image/icons/rating.png', 'Rate'),
                      controllershare.getshare(() {
                        controller.showbuttonad(
                            context, '/In_App_Privacy', '/GetStart', '');
                      }, 'asset/image/icons/Privacy.png', 'Privacy'),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_80()),
                ],
              ),
            ),
            banner.getBN('/Home_Screen')
          ],
        ),
      ),
    );
  }
}

_shareURL() async {
  const url = 'https://in.linkedin.com/company/infinitizi?trk=ppro_cprof';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
