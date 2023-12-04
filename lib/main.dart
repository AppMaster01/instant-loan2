// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member, equal_keys_in_map

import 'dart:convert';
import 'package:loan_instant_2/screen/EMI_TYPE/EMI_Loan_Calculator_Screen.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/EMI_TYPE.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/SELET_EMI/SELECT_EMI.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/Your_EMi.dart';
import 'package:loan_instant_2/screen/EMI_TYPE/SELET_EMI/select_your_emi.dart';
import 'package:loan_instant_2/screen/Getstart.dart';
import 'package:loan_instant_2/screen/Home_Screen.dart';
import 'package:loan_instant_2/screen/Loan_Type/Loan_Details.dart';
import 'package:loan_instant_2/screen/Loan_Type/Loan_Type.dart';
import 'package:loan_instant_2/screen/Loan_Work.dart';
import 'package:loan_instant_2/screen/get_online_loan/Fill_Up_Screen/Form_1.dart';
import 'package:loan_instant_2/screen/get_online_loan/Fill_Up_Screen/Form_2.dart';
import 'package:loan_instant_2/screen/get_online_loan/Fill_Up_Screen/Form_3.dart';
import 'package:loan_instant_2/screen/get_online_loan/Fill_Up_Screen/Form_4.dart';
import 'package:loan_instant_2/screen/get_online_loan/Loan_Summary.dart';
import 'package:loan_instant_2/screen/get_online_loan/Loan_approved_Screen.dart';
import 'package:loan_instant_2/screen/get_online_loan/Payday_loan_screen.dart';
import 'package:loan_instant_2/screen/get_online_loan/See_all_loans_screen.dart';
import 'package:loan_instant_2/screen/get_online_loan/Select_loan_amount_screen.dart';
import 'package:loan_instant_2/screen/get_online_loan/Select_loan_screen.dart';
import 'package:loan_instant_2/screen/insurance/fill_up_insurance/insurance_1.dart';
import 'package:loan_instant_2/screen/insurance/fill_up_insurance/insurance_2.dart';
import 'package:loan_instant_2/screen/insurance/fill_up_insurance/insurance_3.dart';
import 'package:loan_instant_2/screen/insurance/fill_up_insurance/insurance_4.dart';
import 'package:loan_instant_2/screen/insurance/fill_up_insurance/insurance_apraval.dart';
import 'package:loan_instant_2/splash.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Controller_Page/My_Controller.dart';
import 'inapp_web_view/in_app.dart';

MyAppController myAppController = Get.put(MyAppController());

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap LoanData = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    adUnitId: LoanData.value['APPOPEN'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        ad.show();
      },
      onAdFailedToLoad: (error) {},
    ),
  );
}

//
AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "Hello ", "Rohan",
    playSound: true, importance: Importance.high);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  initConfig().whenComplete(() {
    LoanData.value = json.decode(remoteConfig.getString('Loaninstant'));
    loadAd();
  });

  return runApp(GetMaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Splash_Screen(),
      '/GetStart': (context) => const GetStart(),
      '/Home_Screen': (context) => const Home_Screen(),
      '/get_online_loan': (context) => const get_online_loan(),
      '/Loan_Type': (context) => const Loan_Type(),
      '/Loan_Details': (context) => const Loan_Details(),
      '/EMI': (context) => const EMI(),
      '/EMI_Loan_Calculator_Screen': (context) =>
          const EMI_Loan_Calculator_Screen(),
      '/Your_EMI': (context) => const Your_EMI(),
      '/get_online_loan': (context) => const get_online_loan(),
      '/Payday_loan_screen': (context) => const Payday_loan_screen(),
      '/Select_loan_amount_screen': (context) =>
          const Select_loan_amount_screen(),
      '/See_all_loans_screen': (context) => const See_all_loans_screen(),
      '/Loan_Summary': (context) => const Loan_Summary(),
      '/Loan_approved_Screen': (context) => const Loan_approved_Screen(),
      '/Form_1': (context) => const Form_1(),
      '/Form_2': (context) => const Form_2(),
      '/Form_3': (context) => const Form_3(),
      '/Form_4': (context) => const Form_4(),
      '/insurance_1': (context) => const insurance_1(),
      '/insurance_2': (context) => const insurance_2(),
      '/insurance_3': (context) => const insurance_3(),
      '/insurance_4': (context) => const insurance_4(),
      '/insurance_approved_Screen': (context) =>
          const insurance_approved_Screen(),
      '/In_App_Privacy': (context) => const In_App_Privacy(),
      '/Loan_Work': (context) => const Loan_Work(),
      '/Your_EMI2': (context) => const Your_EMI2(),
      '/EMI_Loan_Calculator_Screen2': (context) =>
          const EMI_Loan_Calculator_Screen2(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
