// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

class get_online_loan extends StatefulWidget {
  const get_online_loan({Key? key}) : super(key: key);

  @override
  State<get_online_loan> createState() => _get_online_loanState();
}

class _get_online_loanState extends State<get_online_loan> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.showbuttonad(
          context, '/Home_Screen', '/get_online_loan', ''),
      child: Scaffold(
          appBar: controllerAppbar.getappbar('Select Loan', () {
            controller.showbuttonad(
                context, '/Home_Screen', '/get_online_loan', '');
          }),
          body: Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: ScreenSize.fSize_50()),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: CCOLOR.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          controllerColorContain.getcontainer(() async {
                            controller.showbuttonad(context,
                                '/Payday_loan_screen', '/get_online_loan', '');
                          }, CCOLOR[index], Rcolor[index], IMAGESSS[index],
                              Ttital[index], TCOLOR[index], descrip[index]),
                        ],
                      );
                    },
                  ),
                ),
              ),
              banner.getBN('/get_online_loan')
            ],
          )),
    );
  }
}

List CCOLOR = [
  const Color(0xffFEE3E3),
  const Color(0xffBBECD7),
  const Color(0xffFEF0D7),
  const Color(0xffD5DDFF),
  const Color(0xffFEE3E3),
  const Color(0xffBBECD7),
  const Color(0xffFEF0D7),
  const Color(0xffD5DDFF),
];
List Rcolor = [
  const Color(0xffFFEEED),
  const Color(0xffD6F3E7),
  const Color(0xffFFF6E9),
  const Color(0xffE6EAFF),
  const Color(0xffFFEEED),
  const Color(0xffD6F3E7),
  const Color(0xffFFF6E9),
  const Color(0xffE6EAFF),
];

List Ttital = [
  """Payday Loan""",
  """Sameday Loan""",
  """Unsecured Loan""",
  """Secured Loan""",
  """Education Loan""",
  """Home Loan""",
  """Car Loan""",
  """Gold Loan""",
];
List IMAGESSS = [
  "asset/image/icons/payday loan icon.png",
  "asset/image/icons/sameday loan icon.png",
  "asset/image/icons/unsecaured loan icon.png",
  "asset/image/icons/secaured loan icon.png",
  "asset/image/icons/education loan icon.png",
  "asset/image/icons/home loan icon.png",
  "asset/image/icons/car loan icon.png",
  "asset/image/icons/gold loan icon.png",
];
List TCOLOR = [
  const Color(0xff244A44),
  const Color(0xff35295A),
  const Color(0xff552F3B),
  const Color(0xff372808),
  const Color(0xff244A44),
  const Color(0xff35295A),
  const Color(0xff35295A),
  const Color(0xff35295A),
];
List descrip = [
  """Customized payday Loan up to \$${100}K with flexible...""",
  """Get online loan on same day apply now""",
  """Unsecured loans are loans that are not backed by""",
  """A secured loan is a loan in which the borrower""",
  """Get instant Education Loan Online for Pursue your dream""",
  """A home loan is a secured loan taken from a financial institution""",
  """Avail a car loan, or opt for a pre-approved car loan, and get the best""",
  """A gold loan is a method of availing finance/ loan against your gold""",
];
