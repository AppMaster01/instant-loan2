// ignore_for_file: non_constant_identifier_names, camel_case_types, sized_box_for_whitespace, prefer_typing_uninitialized_variables, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/screen/get_online_loan/see_loans_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ads/Google_Ads.dart';
import 'See_all_loans_screen.dart';
import 'Select_loan_amount_screen.dart';

var user;
var Counter = 0.obs;

class Payday_loan_screen extends StatefulWidget {
  const Payday_loan_screen({Key? key}) : super(key: key);

  @override
  State<Payday_loan_screen> createState() => _Payday_loan_screenState();
}

class _Payday_loan_screenState extends State<Payday_loan_screen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  final _isVisible = false.obs;

  void showToast() {
    _isVisible.value = !_isVisible.value;
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Counter.value = ((prefs.getInt('counter') ?? 0));
    prefs.setInt('counter', Counter.value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _incrementCounter();
    shared();
    user;
  }

  var KEYNAME = "name".obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.showbuttonad(
          context, '/get_online_loan', '/Payday_loan_screen', ''),
      child: Scaffold(
        appBar: controllerAppbar.getappbar('Payday Loan', () {
          controller.showbuttonad(
              context, '/get_online_loan', '/Payday_loan_screen', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Stack(
                  children: [
                    Column(
                      children: [
                        Counter.value == 0
                            ? GestureDetector(
                                onTap: () async {
                                  controller.showbuttonad(
                                      context,
                                      '/Select_loan_amount_screen',
                                      '/Payday_loan_screen',
                                      '');
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt('counter', Counter.value);
                                },
                                child: controllerLock
                                    .getselect('Select Loan Amount'))
                            : Counter.value == 1
                                ? controllerselectColorchange.getselect(
                                    () async {
                                    controller.showbuttonad(
                                        context,
                                        '/Select_loan_amount_screen',
                                        '/Payday_loan_screen',
                                        '');
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt('counter', Counter.value);
                                  }, 'Select Loan Amount')
                                : controllerselectColorchange.getselect(
                                    () async {
                                    controller.showbuttonad(
                                        context,
                                        '/Select_loan_amount_screen',
                                        '/Payday_loan_screen',
                                        '');
                                  }, 'Select Loan Amount'),

//=================================================================================================================================
                        Counter.value == 1
                            ? controlleropenLock.getselect(() async {
                                controller.showbuttonad(
                                    context,
                                    '/See_all_loans_screen',
                                    '/Payday_loan_screen',
                                    '');
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt('counter', Counter.value);
                              }, 'See All Loans')
                            : Counter.value >= 2
                                ? controllerselectColorchange.getselect(
                                    () async {
                                    controller.showbuttonad(
                                        context,
                                        '/See_all_loans_screen',
                                        '/Payday_loan_screen',
                                        '');
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt('counter', Counter.value);
                                  }, 'See All Loans')
                                : controllerLock.getselect('See All Loans'),

//=======================================================================================================================================================
                        Counter.value == 2
                            ? controlleropenLock.getselect(() async {
                                controller.showbuttonad(
                                    context,
                                    '/EMI_Loan_Calculator_Screen',
                                    '/Payday_loan_screen',
                                    '');
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt('counter', Counter.value);
                              }, 'EMI Calculator')
                            : Counter.value >= 3
                                ? controllerselectColorchange.getselect(
                                    () async {
                                    controller.showbuttonad(
                                        context,
                                        '/EMI_Loan_Calculator_Screen',
                                        '/Payday_loan_screen',
                                        '');
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt('counter', Counter.value);
                                  }, 'EMI Calculator')
                                : controllerLock.getselect('EMI Calculator'),

//////=================================================================================================================================
                        Counter.value == 3
                            ? GestureDetector(
                                onTap: showToast,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Container(
                                        height: ScreenSize.fSize_60(),
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffF5F5F5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: ScreenSize.fSize_10(),
                                              height: ScreenSize
                                                      .horizontalBlockSize! *
                                                  16.11,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff838383),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            SizedBox(
                                              width: ScreenSize.fSize_30(),
                                            ),
                                            Center(
                                                child: Center(
                                              child: Text(
                                                'Create Your Profile',
                                                style: GoogleFonts.almarai(
                                                    color:
                                                        const Color(0xff838383),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        ScreenSize.fSize_15()),
                                              ),
                                            )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: ScreenSize
                                                          .horizontalBlockSize! *
                                                      39.5),
                                              child: Center(
                                                  child: GestureDetector(
                                                onTap: showToast,
                                                child: Image(
                                                  image: const AssetImage(
                                                      'asset/image/icons/dropdown.png'),
                                                  color:
                                                      const Color(0xff838383),
                                                  height: ScreenSize.fSize_20(),
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Counter.value >= 7
                                ? GestureDetector(
                                    onTap: showToast,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(13),
                                          child: Container(
                                            height: ScreenSize.fSize_60(),
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                                color: Color(0xffF1FCF9),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: ScreenSize.fSize_10(),
                                                  height: ScreenSize
                                                          .horizontalBlockSize! *
                                                      16.11,
                                                  decoration: const BoxDecoration(
                                                      color: Color(0xff009A73),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                ),
                                                SizedBox(
                                                  width: ScreenSize.fSize_30(),
                                                ),
                                                Center(
                                                    child: Center(
                                                  child: Text(
                                                    'Create Your Profile',
                                                    style: GoogleFonts.almarai(
                                                        color: const Color(
                                                            0xff009A73),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: ScreenSize
                                                            .fSize_15()),
                                                  ),
                                                )),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: ScreenSize
                                                              .horizontalBlockSize! *
                                                          39.5),
                                                  child: Center(
                                                      child: GestureDetector(
                                                    onTap: showToast,
                                                    child: Image(
                                                      image: const AssetImage(
                                                          'asset/image/icons/dropdown.png'),
                                                      color: const Color(
                                                          0xff009A73),
                                                      height:
                                                          ScreenSize.fSize_20(),
                                                    ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Counter.value >= 3
                                    ? GestureDetector(
                                        onTap: showToast,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(13),
                                              child: Container(
                                                height: ScreenSize.fSize_60(),
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          ScreenSize.fSize_10(),
                                                      height: ScreenSize
                                                              .horizontalBlockSize! *
                                                          16.11,
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              Color(0xff838383),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          ScreenSize.fSize_30(),
                                                    ),
                                                    Center(
                                                        child: Center(
                                                      child: Text(
                                                        'Create Your Profile',
                                                        style: GoogleFonts.almarai(
                                                            color: const Color(
                                                                0xff838383),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: ScreenSize
                                                                .fSize_15()),
                                                      ),
                                                    )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              39.5),
                                                      child: Center(
                                                          child:
                                                              GestureDetector(
                                                        onTap: showToast,
                                                        child: Image(
                                                          image: const AssetImage(
                                                              'asset/image/icons/dropdown.png'),
                                                          color: const Color(
                                                              0xff838383),
                                                          height: ScreenSize
                                                              .fSize_20(),
                                                        ),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : controllerLock
                                        .getselect('Create Your Profile'),
//=================================================================================================================================
                        Counter.value == 7
                            ? controlleropenLock.getselect(() async {
                                controller.showbuttonad(context,
                                    '/Loan_Summary', '/Payday_loan_screen', '');
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt('counter', Counter.value);
                                Data.addAll({
                                  """amount""":
                                      '${LoanAmount.value.round() + lonaamount[index]}',
                                  "rate":
                                      '${LoanRate.value.round() + rates[index]}',
                                  "duration":
                                      '${LoanDuration.value.round() + Loanterm[index]}',
                                  "calcu": '${emicalculate(index)}',
                                  "fee": "${fee[index]}",
                                });
                              }, 'Loan Summary')
                            : Counter.value == 8
                                ? controllerselectColorchange.getselect(
                                    () async {
                                    controller.showbuttonad(
                                        context,
                                        '/Loan_Summary',
                                        '/Payday_loan_screen',
                                        '');
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt('counter', Counter.value);
                                    Data.addAll({
                                      """amount""":
                                          '${LoanAmount.value.round() + lonaamount[index]}',
                                      "rate":
                                          '${LoanRate.value.round() + rates[index]}',
                                      "duration":
                                          '${LoanDuration.value.round() + Loanterm[index]}',
                                      "calcu": '${emicalculate(index)}',
                                      "fee": "${fee[index]}",
                                    });
                                  }, 'Loan Summary')
                                : controllerLock.getselect('Loan Summary')
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenSize.horizontalBlockSize! * 90),
                      child: Center(
                        child: controllerDrop.getButoon(
                          context,
                          _isVisible.value,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: ScreenSize.fSize_20()),
                              Counter.value == 3
                                  ? controllerdividerunlock
                                      .getdividerunlock(context, () async {
                                      controller.showbuttonad(context,
                                          '/Form_1', '/Payday_loan_screen', '');
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setInt('counter', Counter.value);
                                    },
                                          'Personal Details',
                                          const Color(0xff838383),
                                          const Color(0xff838383))
                                  : Counter.value == 4
                                      ? controllerdividerunlock
                                          .getdividerunlock(context, () async {
                                          controller.showbuttonad(
                                              context,
                                              '/Form_1',
                                              '/Payday_loan_screen',
                                              '');
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setInt(
                                              'counter', Counter.value);
                                        },
                                              'Personal Details',
                                              const Color(0xff009A73),
                                              Colors.transparent)
                                      : controllerdividerunlock
                                          .getdividerunlock(context, () async {
                                          controller.showbuttonad(
                                              context,
                                              '/Form_1',
                                              '/Payday_loan_screen',
                                              '');
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setInt(
                                              'counter', Counter.value);
                                        },
                                              'Personal Details',
                                              const Color(0xff009A73),
                                              Colors.transparent),
                              //============================================================================================================
                              Counter.value == 4
                                  ? controllerdividerunlock
                                      .getdividerunlock(context, () async {
                                      controller.showbuttonad(context,
                                          '/Form_2', '/Payday_loan_screen', '');
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setInt('counter', Counter.value);
                                    },
                                          'Address Details',
                                          const Color(0xff838383),
                                          const Color(0xff838383))
                                  : Counter.value >= 5
                                      ? controllerdividerunlock
                                          .getdividerunlock(context, () async {
                                          controller.showbuttonad(
                                              context,
                                              '/Form_2',
                                              '/Payday_loan_screen',
                                              '');
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setInt(
                                              'counter', Counter.value);
                                        },
                                              'Address Details',
                                              const Color(0xff009A73),
                                              Colors.transparent)
                                      : controllerdividerLock.getdividerLock(
                                          context, 'Address Details'),
                              //============================================================================================================
                              Counter.value == 5
                                  ? controllerdividerunlock
                                      .getdividerunlock(context, () async {
                                      controller.showbuttonad(context,
                                          '/Form_3', '/Payday_loan_screen', '');
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setInt('counter', Counter.value);
                                    }, 'Email Details', const Color(0xff838383),
                                          const Color(0xff838383))
                                  : Counter.value >= 6
                                      ? controllerdividerunlock
                                          .getdividerunlock(context, () async {
                                          controller.showbuttonad(
                                              context,
                                              '/Form_3',
                                              '/Payday_loan_screen',
                                              '');
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setInt(
                                              'counter', Counter.value);
                                        },
                                              'Email Details',
                                              const Color(0xff009A73),
                                              Colors.transparent)
                                      : controllerdividerLock.getdividerLock(
                                          context, 'Email Details'),
                              //============================================================================================================
                              Counter.value == 6
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.showbuttonad(
                                            context,
                                            '/Form_4',
                                            '/Payday_loan_screen',
                                            '');
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              controllerText.getText(
                                                  'Contact Details',
                                                  const Color(0xff838383),
                                                  ScreenSize.fSize_15(),
                                                  FontWeight.w400),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        ScreenSize.fSize_70()),
                                                child: Center(
                                                  child: Image(
                                                      image: const AssetImage(
                                                          'asset/image/icons/unlockd (1).png'),
                                                      color: const Color(
                                                          0xff838383),
                                                      height: ScreenSize
                                                          .fSize_20()),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Counter.value >= 7
                                      ? GestureDetector(
                                          onTap: () async {
                                            controller.showbuttonad(
                                                context,
                                                '/Form_4',
                                                '/Payday_loan_screen',
                                                '');
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setInt(
                                                'counter', Counter.value);
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  controllerText.getText(
                                                      'Contact Details',
                                                      const Color(0xff009A73),
                                                      ScreenSize.fSize_15(),
                                                      FontWeight.w400),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: ScreenSize
                                                            .fSize_70()),
                                                    child: Center(
                                                      child: Image(
                                                          image: const AssetImage(
                                                              'asset/image/icons/unlockd (1).png'),
                                                          color: Colors
                                                              .transparent,
                                                          height: ScreenSize
                                                              .fSize_20()),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: ScreenSize.fSize_110(),
                                                  child: controllerText.getText(
                                                      'Contact Details',
                                                      const Color(0xff838383),
                                                      ScreenSize.fSize_15(),
                                                      FontWeight.w400),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: ScreenSize
                                                          .fSize_70()),
                                                  child: Center(
                                                    child: Image(
                                                        image: const AssetImage(
                                                            'asset/image/icons/Lock.png'),
                                                        color: const Color(
                                                            0xff838383),
                                                        height: ScreenSize
                                                            .fSize_23()),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN('/Payday_loan_screen'),
          ],
        ),
      ),
    );
  }

  shared() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString(KEYNAME.value);
    user = await json.decode(getname!
        .replaceAll(',', '","')
        .replaceAll('{', '{"')
        .replaceAll('}', '"}')
        .replaceAll(":", '":"'));
  }
}
