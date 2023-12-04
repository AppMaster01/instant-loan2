// ignore_for_file: non_constant_identifier_names, camel_case_types, use_build_context_synchronously, sized_box_for_whitespace, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:loan_instant_2/ads/Google_Ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'Payday_loan_screen.dart';
import 'See_all_loans_screen.dart';

double Counter1 = 0.0;

class Loan_Summary extends StatefulWidget {
  const Loan_Summary({Key? key}) : super(key: key);

  @override
  State<Loan_Summary> createState() => _Loan_SummaryState();
}

class _Loan_SummaryState extends State<Loan_Summary> {
  var abc = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
          'Loan Amount',
          Data.isEmpty
              ? 50
              : (int.parse(Data['calcu'])) +
                  0.0 -
                  (int.parse(Data['duration']) + 0.0) -
                  int.parse(Data['amount']) -
                  0.0,
          const Color(0xFF60C014)),
      ChartData(
          'Interest',
          Data.isEmpty
              ? 30
              : (int.parse(Data['calcu'])) +
                  0.0 * (int.parse(Data['duration']) + 0.0),
          const Color(0xFFFF9900)),
      ChartData(
          'Loan Fee',
          Data.isEmpty ? 20 : (int.parse(Data['amount']) / 50 + 0.0),
          const Color(0xFF7F67F2)),
    ];
    return Data.isEmpty
        ? Scaffold(
            appBar: controllerAppbar.getappbar('Loan Summary', () {}),
            body: Center(
                child: controllerContainer.getcontainer(() async {
              controller.showbuttonad(
                  context, '/Payday_loan_screen', '/Loan_Summary', abc);
            },
                    const Color(0xff009A73),
                    Center(
                      child: controllerText.getText('Apply Now', Colors.white,
                          ScreenSize.fSize_15(), FontWeight.w700),
                    ))),
          )
        : WillPopScope(
            onWillPop: () => backbuttoncontroller.showBackbuttonad(
                context, '/Loan_Summary', abc),
            // controller.showbuttonad(
            // context, '/Payday_loan_screen', '/Loan_Summary', abc),
            child: Scaffold(
                backgroundColor: const Color(0xFFF3F3F3),
                appBar: controllerAppbar.getappbar('Loan Summary', () async {
                  // controller.showbuttonad(
                  //     context, '/Payday_loan_screen', '/Loan_Summary', abc);
                  var prefs = await SharedPreferences.getInstance();
                  Counter.value = 8;
                  prefs.setInt('counter', Counter.value);

                  backbuttoncontroller.showBackbuttonad(
                      context, '/Loan_Summary', abc);
                }),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: ScreenSize.fSize_20(),
                                      ),
                                      Container(
                                        height: ScreenSize.fSize_150(),
                                        width: ScreenSize.fSize_150(),
                                        child: Stack(
                                          children: [
                                            Center(
                                                child: Container(
                                              width: ScreenSize.fSize_190(),
                                              height: ScreenSize.fSize_190(),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color:
                                                      const Color(0xFFF1FCF9)),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Your Loan',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              2.7),
                                                    ),
                                                    Text(
                                                      Data == ""
                                                          ? "No value"
                                                          : '\$${Data['amount']}',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              3.2),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                            SfCircularChart(palette: const <
                                                Color>[
                                              Color(0xFF42AE00),
                                              Color(0xFFFFE600),
                                              Color(0xFF6268FB),
                                            ], series: <
                                                CircularSeries<ChartData,
                                                    String>>[
                                              DoughnutSeries<ChartData, String>(
                                                  animationDuration: 1200,
                                                  dataSource: chartData,
                                                  pointColorMapper:
                                                      (ChartData data, _) =>
                                                          data.color,
                                                  xValueMapper:
                                                      (ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data, _) =>
                                                          data.y,
                                                  innerRadius: '80%',
                                                  radius: '100%',
                                                  groupMode:
                                                      CircularChartGroupMode
                                                          .point,
                                                  groupTo: 2),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenSize.fSize_8(),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          controllercolor.getcircle(context,
                                              'Loan Amount', 0xFF60C014),
                                          SizedBox(
                                              height: ScreenSize.fSize_20()),
                                          controllercolor.getcircle(
                                              context, 'Interest', 0xFFFF9900),
                                          SizedBox(
                                              height: ScreenSize.fSize_20()),
                                          controllercolor.getcircle(
                                              context, 'Loan Fee', 0xFF7F67F2),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenSize.fSize_20(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF1FCF9),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        border: Border.all(
                                            color: const Color(0xffE2E6EA))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: ScreenSize.fSize_25(),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: ScreenSize.fSize_30(),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                controllername.getname(
                                                    context, 'Your Name '),
                                                H.HIGHT(),
                                                controllername.getname(
                                                    context, 'Email Address'),
                                                H.HIGHT(),
                                                controllername.getname(context,
                                                    'Total Loan Amount'),
                                                H.HIGHT(),
                                                controllername.getname(
                                                    context, 'Interest Rate'),
                                                H.HIGHT(),
                                                controllername.getname(
                                                    context, 'Loan Duration'),
                                                H.HIGHT(),
                                                controllername.getname(
                                                    context, 'Total Fee'),
                                                H.HIGHT(),
                                                controllername.getname(
                                                    context, 'Monthly Payment'),
                                                H.HIGHT(),
                                              ],
                                            ),
                                            SizedBox(
                                                width: ScreenSize.fSize_50()),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                controllername2.getname(
                                                    context,
                                                    // "${abc[1]}  ${abc[2]}"
                                                    Data == ""
                                                        ? "enter name"
                                                        : '${Data['Firstname']} ${Data['LastName']}'),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                    context,
                                                    Data == ""
                                                        ? "enter email"
                                                        : '${Data['EMIAL']}'

                                                    // "${abc[1]}"
                                                    ),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                    context,
                                                    Data == ""
                                                        ? "No value"
                                                        : '\$${Data["amount"]}'),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                  context,
                                                  Data == ""
                                                      ? "No value"
                                                      : '${Data["rate"]}%',
                                                ),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                  context,
                                                  Data == ""
                                                      ? "No value"
                                                      : '${Data["duration"]} Months',
                                                ),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                    context,
                                                    Data == ""
                                                        ? "No value"
                                                        : '\$${Data['fee']}'),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                                controllername2.getname(
                                                    context,
                                                    Data == ""
                                                        ? "No value"
                                                        : '\$${Data['calcu']}'),
                                                SizedBox(
                                                  height: ScreenSize.fSize_23(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenSize.fSize_30(),
                                  ),
                                  controllerContainer.getcontainer(() async {
                                    controller.showbuttonad(
                                        context,
                                        '/Loan_approved_Screen',
                                        '/Loan_Summary',
                                        abc);
                                    var prefs =
                                        await SharedPreferences.getInstance();
                                    Counter.value = 8;
                                    prefs.setInt('counter', Counter.value);
                                  },
                                      const Color(0xff009A73),
                                      Center(
                                        child: controllerText.getText(
                                            'Apply Now',
                                            Colors.white,
                                            ScreenSize.fSize_15(),
                                            FontWeight.w700),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.fSize_50(),
                          ),
                        ],
                      ),
                    ),
                    banner.getBN('/Loan_Summary'),
                  ],
                )),
          );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

List fees = [55, 43, 37, 18, 20, 40, 34, 32, 35, 41, 19, 50];
