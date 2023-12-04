// ignore_for_file: deprecated_member_use, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

int index = 0;
final controllerContainer = Get.put(Containercontroller());
final controllershare = Get.put(shareController());
final controllerText = Get.put(TextController());
final controllerAppbar = Get.put(AppbarController());
final controllerdrawer = Get.put(drawerController());
final controllericon = Get.put(iconController());
final controllerColorContain = Get.put(COLORCONTAINController());
final controllerColorContain22 = Get.put(COLORCONTAIN22Controller());
final controllerslider = Get.put(sliderController());
final controllerselectColorchange = Get.put(selectcontroller());
final controllerLock = Get.put(select2controller());
final controlleropenLock = Get.put(OpenLockcontroller());
final controllerwhite = Get.put(whitecontroller());
final controllertexfiled = Get.put(TEXTFILEDcontroller());
final controllercolor = Get.put(circleController());
final controllername = Get.put(nameController());
final controllername2 = Get.put(name2Controller());
final controllerEXIT = Get.put(EXITController());
final controllerindi = Get.put(indiController());
final controllerindimini = Get.put(indminiController());
final controllerDrop = Get.put(dropcontroller());
final controllerdividerunlock = Get.put(dividercontroller());
final controllerdividerLock = Get.put(dividerLockcontroller());
final H = Get.put(h());

class h extends GetxController {
  HIGHT() {
    return SizedBox(
      height: ScreenSize.fSize_25(),
    );
  }
}

class dividercontroller extends GetxController {
  getdividerunlock(context, ontap, text, color, color1) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: ScreenSize.fSize_110(),
                child: controllerText.getText(
                    text, color, ScreenSize.fSize_15(), FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenSize.fSize_70()),
                child: Center(
                  child: Image(
                      image:
                          const AssetImage('asset/image/icons/unlockd (1).png'),
                      color: color1,
                      height: ScreenSize.fSize_23()),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: ScreenSize.fSize_25(),
          color: const Color(0xffE2E6EA),
          thickness: 1,
          indent: ScreenSize.fSize_28(),
          endIndent: ScreenSize.fSize_28(),
        ),
      ],
    );
  }
}

class dividerLockcontroller extends GetxController {
  getdividerLock(context, text) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: ScreenSize.fSize_110(),
              child: controllerText.getText(text, const Color(0xff838383),
                  ScreenSize.fSize_15(), FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_70()),
              child: Center(
                child: Image(
                    image: const AssetImage('asset/image/icons/Lock.png'),
                    color: const Color(0xff838383),
                    height: ScreenSize.fSize_23()),
              ),
            )
          ],
        ),
        Divider(
          height: ScreenSize.fSize_25(),
          color: const Color(0xffE2E6EA),
          thickness: 1,
          indent: ScreenSize.fSize_28(),
          endIndent: ScreenSize.fSize_28(),
        ),
      ],
    );
  }
}

class nameController extends GetxController {
  getname(context, String text) {
    return Text(
      text,
      style: GoogleFonts.almarai(
          fontWeight: FontWeight.w500, fontSize: ScreenSize.fSize_13()),
    );
  }
}

class name2Controller extends GetxController {
  getname(context, String text) {
    return SizedBox(
      width: ScreenSize.fSize_100(),
      child: Text(
        overflow: TextOverflow.ellipsis,
        text,
        style: GoogleFonts.almarai(
            fontWeight: FontWeight.w700, fontSize: ScreenSize.fSize_16()),
      ),
    );
  }
}

class circleController extends GetxController {
  getcircle(context, String text, color) {
    return Row(
      children: [
        SizedBox(width: ScreenSize.fSize_23()),
        CircleAvatar(
          backgroundColor: Color(color),
          minRadius: ScreenSize.fSize_6(),
        ),
        SizedBox(width: ScreenSize.fSize_10()),
        Text(
          text,
          style: GoogleFonts.almarai(
              fontSize: ScreenSize.fSize_10(),
              color: const Color(0xff2F364D),
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class TEXTFILEDcontroller extends GetxController {
  gettextfiled(widght, text, controller, KYPE) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: ScreenSize.fSize_13()),
            controllerText.getText(text, const Color(0xff009A73),
                ScreenSize.fSize_12(), FontWeight.w400),
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: ScreenSize.fSize_60(),
                width: widght,
                decoration: const BoxDecoration(
                    color: Color(0xffF1FCF9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: TextField(
                  controller: controller,
                  keyboardType: KYPE,
                  cursorHeight: ScreenSize.fSize_25(),
                  cursorColor: const Color(0xff009A73),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        horizontal: ScreenSize.horizontalBlockSize! * 8,
                        vertical: ScreenSize.fSize_12()),
                    // fillColor: Colors.transparent,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    // focusedErrorBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.transparent)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: ScreenSize.fSize_10(),
                height: ScreenSize.fSize_60(),
                decoration: const BoxDecoration(
                    color: Color(0xff009A73),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class whitecontroller extends GetxController {
  getselect(hight, widget) {
    return Container(
      height: hight,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          border: Border.all(color: const Color(0xffE2E6EA))),
      child: widget,
    );
  }
}

class selectcontroller extends GetxController {
  getselect(ontap, text) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Container(
          height: ScreenSize.fSize_60(),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xffF1FCF9),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenSize.fSize_10(),
                height: ScreenSize.horizontalBlockSize! * 16.11,
                decoration: const BoxDecoration(
                    color: Color(0xff009A73),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
              ),
              SizedBox(
                width: ScreenSize.fSize_30(),
              ),
              Center(
                  child: Text(
                text,
                style: GoogleFonts.almarai(
                    color: const Color(0xff009A73),
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenSize.fSize_15()),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class OpenLockcontroller extends GetxController {
  getselect(ontap, text) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Container(
          height: ScreenSize.fSize_60(),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenSize.fSize_10(),
                height: ScreenSize.horizontalBlockSize! * 16.11,
                decoration: const BoxDecoration(
                    color: Color(0xff838383),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
              ),
              SizedBox(
                width: ScreenSize.fSize_30(),
              ),
              Center(
                  child: Container(
                width: ScreenSize.fSize_180(),
                child: Text(
                  text,
                  style: GoogleFonts.almarai(
                      color: const Color(0xff838383),
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenSize.fSize_15()),
                ),
              )),
              Padding(
                padding: EdgeInsets.only(left: ScreenSize.fSize_70()),
                child: Center(
                  child: Image(
                      image:
                          const AssetImage('asset/image/icons/unlockd (1).png'),
                      color: const Color(0xff838383),
                      height: ScreenSize.fSize_28()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class select2controller extends GetxController {
  getselect(text) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        height: ScreenSize.fSize_60(),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ScreenSize.fSize_10(),
              height: ScreenSize.horizontalBlockSize! * 16.11,
              decoration: const BoxDecoration(
                  color: Color(0xff838383),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10))),
            ),
            SizedBox(
              width: ScreenSize.fSize_30(),
            ),
            Center(
                child: Container(
              width: ScreenSize.fSize_180(),
              child: Text(
                text,
                style: GoogleFonts.almarai(
                    color: const Color(0xff838383),
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenSize.fSize_15()),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_70()),
              child: Center(
                child: Image(
                    image: const AssetImage('asset/image/icons/Lock.png'),
                    height: ScreenSize.fSize_28()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Containercontroller extends GetxController {
  getcontainer(ontap, color, widget) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.fSize_180(),
        height: ScreenSize.fSize_45(),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: widget,
      ),
    );
  }
}

class shareController extends GetxController {
  getshare(ontap, image, text) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Column(
          children: [
            Center(
                child: Image(
              image: AssetImage(image),
              width: ScreenSize.fSize_34(),
            )),
            SizedBox(height: ScreenSize.fSize_10()),
            Text(
              text,
              style: GoogleFonts.almarai(
                  color: const Color(0xff009A73),
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenSize.fSize_14()),
            )
          ],
        ),
      ),
    );
  }
}

class TextController extends GetxController {
  getText(text, color, size, wight) {
    return Text(text,
        style: GoogleFonts.almarai(
            color: color, fontSize: size, fontWeight: wight));
  }
}

class indiController extends GetxController {
  get() {
    return Container(
      width: ScreenSize.horizontalBlockSize! * 6.1,
      height: ScreenSize.horizontalBlockSize! * 1.8,
      decoration: const BoxDecoration(
          color: Color(0xff009A73),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
    );
  }
}

class indminiController extends GetxController {
  get() {
    return CircleAvatar(
      minRadius: ScreenSize.horizontalBlockSize! * 1,
      backgroundColor: const Color(0xffD3F1E9),
    );
  }
}

class AppbarController extends GetxController {
  getappbar(text, ontap) {
    return AppBar(
        leading: GestureDetector(
          onTap: ontap,
          child: Center(
              child: Image(
            image: const AssetImage('asset/image/icons/chevron-left.png'),
            width: ScreenSize.fSize_30(),
          )),
        ),
        title: Text(text,
            style: GoogleFonts.almarai(
                color: const Color(0xff2F364D),
                fontWeight: FontWeight.w700,
                fontSize: ScreenSize.horizontalBlockSize! * 5.2)),
        backgroundColor: Colors.white10,
        elevation: 0);
  }
}

class drawerController extends GetxController {
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

  getelevated(
    context,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: ScreenSize.horizontalBlockSize! * 75,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffF1FCF9),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_30()),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
                    Image(
                        height: ScreenSize.fSize_90(),
                        image: const AssetImage('asset/image/logo/logo.png')),
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllerText.getText(
                        'INSTANT CASH LOAN',
                        const Color(0xff009A73),
                        ScreenSize.fSize_20(),
                        FontWeight.w800)
                  ]),
            ),
          ),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons('asset/image/icons/home.png', 'Home', () {
            controller.showbuttonad(context, '/GetStart', '/Home_Screen', '');
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons('asset/image/icons/apply.png', 'Apply', () {
            controller.showbuttonad(context, '/Form_1', '/Home_Screen', '');
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons('asset/image/icons/guide.png', 'Guide', () {
            controller.showbuttonad(context, '/Loan_Work', '/Home_Screen', '');
            // Get.to(() => Loan_Work());
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon
              .geticons('asset/image/icons/loan status.png', 'Loan Status', () {
            controller.showbuttonad(
                context, '/Loan_Summary', '/Home_Screen', 'arg');
            // Get.to(() => Loan_Summary(
            //       indexs: index,
            //       loanlist: Loan_List,
            //     ));
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons('asset/image/icons/share.png', 'Share', () {
            Share.share('https://www.google.com/');
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons(
              'asset/image/icons/rating.png', 'Rate Us', _shareURL),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon
              .geticons('asset/image/icons/Privacy.png', 'Privacy Policy', () {
            controller.showbuttonad(
                context, '/In_App_Privacy', '/Home_Screen', '');
          }),
          SizedBox(height: ScreenSize.fSize_30()),
          controllericon.geticons('asset/image/icons/exit.png', 'Exit', () {
            Get.back();
            _onWillPop(context);
          }),
          SizedBox(height: ScreenSize.fSize_30()),
        ],
      ),
    );
  }
}

class iconController extends GetxController {
  geticons(String image, String name, onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: ScreenSize.fSize_40()),
              Image(height: ScreenSize.fSize_28(), image: AssetImage(image)),
              SizedBox(width: ScreenSize.fSize_30()),
              Text(name,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenSize.fSize_16())),
            ],
          ),
        ),
      ],
    );
  }
}

class COLORCONTAINController extends GetxController {
  getcontainer(ontap, Containercolor, Rtanglcolor, Rantagleimage, TITAL,
      TtlColor, DIscrip) {
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          width: ScreenSize.horizontalBlockSize! * 43,
          // height: ScreenSize.horizontalBlockSize! * 55,
          decoration: BoxDecoration(
              color: Containercolor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: const AssetImage(
                            'asset/image/icons/Rectangle 35.png'),
                        color: Rtanglcolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                            child: Image(
                          image: AssetImage(Rantagleimage),
                          height: ScreenSize.fSize_45(),
                        )),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_15()),
              Row(
                children: [
                  SizedBox(width: ScreenSize.fSize_14()),
                  controllerText.getText(
                      TITAL, TtlColor, ScreenSize.fSize_17(), FontWeight.w700),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_10()),
              Padding(
                padding: EdgeInsets.only(left: ScreenSize.fSize_12()),
                child: Container(
                  height: ScreenSize.fSize_45(),
                  child: Text(DIscrip,
                      style: GoogleFonts.almarai(
                          color: TtlColor, fontWeight: FontWeight.w400)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Image(
                        image: const AssetImage(
                            'asset/image/icons/Arrow-right.png'),
                        width: ScreenSize.fSize_30(),
                        color: TtlColor),
                  ),
                  SizedBox(width: ScreenSize.fSize_10()),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_10()),
            ],
          ),
        ),
      ),
    );
  }
}

class COLORCONTAIN22Controller extends GetxController {
  getcontainer22(ontap, hight, Containercolor, Rtanglcolor, Rantagleimage,
      TITAL, TtlColor) {
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          width: ScreenSize.horizontalBlockSize! * 43,
          height: hight,
          decoration: BoxDecoration(
              color: Containercolor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: const AssetImage(
                            'asset/image/icons/Rectangle 35.png'),
                        height: ScreenSize.fSize_70(),
                        color: Rtanglcolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                            child: Image(
                          image: AssetImage(Rantagleimage),
                          height: ScreenSize.fSize_34(),
                        )),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_15()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenSize.fSize_6()),
                child: Container(
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    TITAL.toString(),
                    style: GoogleFonts.almarai(
                        color: TtlColor,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenSize.horizontalBlockSize! * 5),
                  ),
                ),
              )
              // controllerText.getText(
              //     TITAL, TtlColor, ScreenSize.fSize_17(), FontWeight.w700),
            ],
          ),
        ),
      ),
    );
  }
}

class sliderController extends GetxController {
  getslider(
      text, hight, value, onChanged, start, end, SLidervalue, double max) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: hight,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            border: Border.all(color: const Color(0xffE2E6EA))),
        child: Column(
          children: [
            SizedBox(height: ScreenSize.fSize_10()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controllerText.getText(text, const Color(0xff009A73),
                    ScreenSize.fSize_20(), FontWeight.w700),
                Container(
                    height: ScreenSize.fSize_34(),
                    width: ScreenSize.fSize_120(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF1FCF9),
                    ),
                    child: Center(
                      child: controllerText.getText(
                          SLidervalue,
                          const Color(0xff2F364D),
                          ScreenSize.fSize_15(),
                          FontWeight.w800),
                    )),
              ],
            ),
            SizedBox(height: ScreenSize.fSize_10()),
            Slider(
              activeColor: const Color(0xff009A73),
              inactiveColor: const Color(0xffE2E6EA),
              min: 0,
              max: max,
              value: value,
              onChanged: onChanged,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  start.toString(),
                  style: GoogleFonts.almarai(),
                ),
                SizedBox(width: ScreenSize.fSize_100()),
                Text(
                  end.toString(),
                  style: GoogleFonts.almarai(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EXITController extends GetxController {
  getEXIT(ontap, color, text, Tcolor) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: ScreenSize.fSize_120(),
        height: ScreenSize.horizontalBlockSize! * 11.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.almarai(
              fontSize: ScreenSize.fSize_15(),
              fontWeight: FontWeight.w700,
              color: Tcolor),
        )),
      ),
    );
  }
}

class dropcontroller extends GetxController {
  getButoon(context, ontap, child) {
    return Container(
        height: ScreenSize.fSize_200(),
        width: ScreenSize.horizontalBlockSize! * 90,
        child: Visibility(
          visible: ontap,
          child: Container(
              height: ScreenSize.fSize_200(),
              width: ScreenSize.horizontalBlockSize! * 88,
              decoration: BoxDecoration(
                  color: const Color(0xffFFFCFB),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 3,
                        color: Colors.black26)
                  ],
                  border: Border.all(color: const Color(0xffE2E6EA))),
              child: child),
        ));
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
