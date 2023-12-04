// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Controller_Page/My_Controller.dart';
import 'Media_qury.dart';

class Splash_Screen extends StatelessWidget {
  Splash_Screen({Key? key}) : super(key: key);

  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: ScreenSize.fSize_3()),
                  Image(
                      height: ScreenSize.fSize_160(),
                      image: const AssetImage('asset/image/logo/logo.png')),
                  Text('INSTANT CASH LOAN',
                      style: GoogleFonts.inknutAntiqua(
                          color: const Color(0xff009A73),
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenSize.horizontalBlockSize! * 6.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
