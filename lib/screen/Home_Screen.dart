// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:url_launcher/url_launcher.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.showbuttonad(context, '/GetStart', '/Home_Screen', '');


        return Future.value(false);
      },
      child: Scaffold(
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: controllerdrawer.getelevated(
              context,
            )),
        appBar: AppBar(
            leading: Builder(builder: (context) {
              return Center(
                  child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image(
                  image: const AssetImage('asset/image/icons/Menu.png'),
                  width: ScreenSize.fSize_30(),
                ),
              ));
            }),
            title: Text('Select Category',
                style: GoogleFonts.almarai(
                    color: const Color(0xff2F364D),
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenSize.horizontalBlockSize! * 5.2)),
            backgroundColor: Colors.white10,
            elevation: 0),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllerColorContain.getcontainer(() {
                          controller.showbuttonad(
                              context, '/get_online_loan', '/Home_Screen', '');
                        },
                            const Color(0xffBBECD7),
                            const Color(0xffD6F3E7),
                            'asset/image/icons/loan online .png',
                            'Get Loan Online',
                            const Color(0xff244A44),
                            """Online loan with minimum documents and less approval time"""),
                        controllerColorContain.getcontainer(() {
                          controller.showbuttonad(
                              context, '/Loan_Type', '/Home_Screen', '');
                        },
                            const Color(0xffD5DDFF),
                            const Color(0xffE6EAFF),
                            'asset/image/icons/loan type.png',
                            'Loan Type',
                            const Color(0xff35295A),
                            """Check type of loan and get more information about loan"""),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllerColorContain.getcontainer(() {
                          controller.showbuttonad(
                              context, '/EMI_Loan_Calculator_Screen2', '/Home_Screen', '');
                        },
                            const Color(0xffFEE3E3),
                            const Color(0xffFFEEED),
                            'asset/image/icons/emi calculator.png',
                            'EMI Calculator',
                            const Color(0xff552F3B),
                            """Easy manage your monthly emi using emi calculator"""),
                        controllerColorContain.getcontainer(() {
                          launchscore();
                        },
                            const Color(0xffFEF0D7),
                            const Color(0xffFFF6E9),
                            'asset/image/icons/credit score.png',
                            'Credit Score',
                            const Color(0xff372808),
                            """Check your credit score free and increase for best loan offers"""),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllerColorContain.getcontainer(() {
                          launchATMUrl('ATM');
                        },
                            const Color(0xffBBECD7),
                            const Color(0xffD6F3E7),
                            'asset/image/icons/atm.png',
                            'Near ATM',
                            const Color(0xff244A44),
                            """Now find your nearest atm machine online by only one click"""),
                        controllerColorContain.getcontainer(() {
                          launchbankUrl('Bank');
                        },
                            const Color(0xffD5DDFF),
                            const Color(0xffE6EAFF),
                            'asset/image/icons/bank.png',
                            'Near Bank',
                            const Color(0xff35295A),
                            """Now find your nearest bank online by only one click"""),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_18()),
                        controllerColorContain.getcontainer(() {
                          controller.showbuttonad(
                              context, '/insurance_1', '/Home_Screen', '');
                        },
                            const Color(0xffFEE3E3),
                            const Color(0xffFFEEED),
                            'asset/image/icons/insurance.png',
                            'Insurance',
                            const Color(0xff552F3B),
                            """Future protection - complete protection for your loved ones"""),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
            ),
            banner.getBN('/Home_Screen')
          ],
        ),
      ),
    );
  }
}

launchbankUrl(String lat) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat near me';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchATMUrl(String lat) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat near me';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchscore() async {
  const url =
      'https://creditreport.paisabazaar.com/credit-report/apply?utm_title=bureau_cibil_privilege&utm_source=google_performance_max&utm_medium=ppc0paisabazaar&utm_term=&utm_campaign=LS_CS_Pan_India_Performance_Max&utm_network=x&utm_matchtype=&utm_device=c&utm_placement=&utm_content=&utm_Adposition=&utm_location=9062198&utm_Sitelink=&utm_Audience=&utm_Promotion=&utm_Price=&utm_campaignid=14530768024&gad=1&gclid=Cj0KCQjwmtGjBhDhARIsAEqfDEf0MwuozMKVnAT_r5DHU4m3Vu6U7-iU_F-g9orcvkTpQJCZvOYxWgcaAisXEALw_wcB';
  if (await canLaunch(url)) {
    await launch(url);
  } else {}
}
