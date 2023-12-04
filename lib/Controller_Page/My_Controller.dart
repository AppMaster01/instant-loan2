// ignore_for_file: invalid_use_of_protected_member, prefer_typing_uninitialized_variables, prefer_const_declarations

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loan_instant_2/screen/Getstart.dart';

import '../main.dart';
import 'package:timezone/timezone.dart' as tz;

class MyAppController extends GetxController with WidgetsBindingObserver {
  bool isPaused = false;

  bool isLoaded = false;
  NativeAd? nativeAd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // appOpenAdManager.loadAd();
    Future.delayed(const Duration(seconds: 3), () async {
      LoanData.value != {}
          ? Get.off(() => const GetStart())
          : initConfig().whenComplete(() {
              LoanData.value =
                  json.decode(remoteConfig.getString('Loaninstant'));
            });
      await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        LoanData.value['Title'],
        LoanData.value['Body'],
        tz.TZDateTime.now(tz.local).add(Duration(
          hours: LoanData.value['time'],
        )),
        const NotificationDetails(
          // Android details
          android: AndroidNotificationDetails('', 'Main ',
              channelDescription: "ashwin",
              importance: Importance.max,
              priority: Priority.max),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    playSound: true,
                    color: Colors.blue,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        var context;
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body.toString()),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
