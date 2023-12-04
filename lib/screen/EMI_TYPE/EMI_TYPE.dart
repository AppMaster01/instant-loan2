import 'package:flutter/material.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';

class EMI extends StatelessWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/EMI', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('EMI Type', () {
          backbuttoncontroller.showBackbuttonad(context, '/EMI', '');
        }),
        body: Stack(
          children: [
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return controllerColorContain22.getcontainer22(() {
                  controller.showbuttonad(
                      context, '/EMI_Loan_Calculator_Screen', '/EMI', '');
                }, ScreenSize.horizontalBlockSize! * 48, color[index],
                    color2[index], photo[index], name[index], tcolor[index]);
              },
            ),
            banner.getBN('/EMI')
          ],
        ),
      ),
    );
  }
}

List color = [
  const Color(0xffFEF0D7),
  const Color(0xffFEE3E3),
  const Color(0xffD5DDFF),
];
List color2 = [
  const Color(0xffFFF6E9),
  const Color(0xffFFEEED),
  const Color(0xffE6EAFF),
];
List photo = [
  "asset/image/icons/emi calculator.png",
  "asset/image/icons/home loan calculator.png",
  "asset/image/icons/car loan calculator.png",
];
List name = [
  """Personal Loan EMI Calculator""",
  """Home Loan EMI
Calculator""",
  """Car Loan
EMI
Calculator""",
];
List tcolor = [
  const Color(0xff372808),
  const Color(0xff552F3B),
  const Color(0xff35295A),
];
