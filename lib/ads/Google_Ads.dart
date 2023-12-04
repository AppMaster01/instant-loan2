// ignore_for_file: invalid_use_of_protected_member, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loan_instant_2/Media_qury.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

final native = Get.put(NativeAds());
final banner = Get.put(BannerAds());

void initState() {
  FacebookAudienceNetwork.init();
}

class NativeAds extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Widget getNT(context, String name, String Factoryid) {
    late NativeAd nativeAd;
    var isLoaded = false.obs;
    if (LoanData.value[name]["N_AD_TYPE"] == "ADMOB") {
      nativeAd = NativeAd(
        request: const AdManagerAdRequest(),
        adUnitId: LoanData.value[name]["N_ADMOB"],
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            nativeAd.load();
            isLoaded.value = true;
            print("Native ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            print("Native ad Failed to Load");
          },
          onAdImpression: (ad) {
            print('native onAdImpression ');
          },
        ),
        // factoryId: 'listTileMedium',
        factoryId: Factoryid,
      );
      nativeAd.load();
    }
    // ScreenSize.fSize_150()
    return LoanData.value[name]["N_AD_TYPE"] == "ADMOB"
        ? Obx(() => isLoaded.value
            ? Factoryid == "listTile"
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          height: ScreenSize.fSize_150(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: const Color(0xff009A73), width: 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              // BoxShadow(
                              //   color: Colors.black26,
                              //   blurRadius: 4,
                              // )
                            ],
                          ),
                          child: AdWidget(
                            ad: nativeAd,
                          ),
                          // color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenSize.fSize_340(),
                          height: ScreenSize.fSize_250(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Colors.black26,
                            //     blurRadius: 4,
                            //   )
                            // ],
                            border:
                                Border.all(color: const Color(0xff009A73), width: 1),
                          ),
                          child: AdWidget(
                            ad: nativeAd,
                          ),
                          // color: Colors.blue,
                        ),
                      ],
                    ),
                  )
            : Factoryid == "listTileMedium"
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.fSize_340(),
                      height: ScreenSize.fSize_250(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.black26,
                        //     blurRadius: 4,
                        //   )
                        // ],
                        border: Border.all(color: const Color(0xff009A73), width: 1),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff009A73),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.fSize_340(),
                      height: ScreenSize.fSize_150(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.black26,
                        //     blurRadius: 4,
                        //   )
                        // ],
                        border: Border.all(color: const Color(0xff009A73), width: 1),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff009A73),
                        ),
                      ),
                    ),
                  ))
        : LoanData.value[name]["N_AD_TYPE"] == "FB"
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: ScreenSize.fSize_350(),
                  height: Factoryid == "listTile"
                      ? ScreenSize.fSize_150()
                      : ScreenSize.fSize_250(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black26,
                    //     blurRadius: 4,
                    //   )
                    // ],
                    border: Border.all(color: const Color(0xff009A73), width: 1),
                  ),
                  child: FacebookNativeAd(
                    placementId: LoanData.value["N_FB"],
                    adType: NativeAdType.NATIVE_AD,
                    width: ScreenSize.fSize_350(),
                    height: Factoryid == "listTile"
                        ? ScreenSize.fSize_150()
                        : ScreenSize.fSize_250(),
                    backgroundColor: Colors.white,
                    titleColor: Colors.black,
                    descriptionColor: Colors.black,
                    buttonColor: const Color(0xff009A73),
                    buttonTitleColor: Colors.white,
                    listener: (result, value) {
                      print("Native Ad: $result --> $value");
                    },
                    keepExpandedWhileLoading: true,
                    expandAnimationDuraion: 1000,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  _launchURL(LoanData.value[name]["URL"]);
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: ScreenSize.fSize_340(),
                        height: Factoryid == "listTile"
                            ? ScreenSize.fSize_150()
                            : ScreenSize.fSize_250(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  LoanData.value[name]["IMAGE_URL"]),
                              fit: BoxFit.fill),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.black26,
                          //     blurRadius: 4,
                          //   )
                          // ],
                          border:
                              Border.all(color: const Color(0xff009A73), width: 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenSize.fSize_12(),
                      left: ScreenSize.fSize_12(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF26A4FB),
                            borderRadius: BorderRadius.circular(5)),
                        height: ScreenSize.fSize_15(),
                        width: ScreenSize.fSize_25(),
                        child: Center(
                          child: Text('Ad',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSize.fSize_10())),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

//======================================FACEBOOK BANNER===================================================
int counter = 1;

class BannerAds extends GetxController {
  BannerAd? bannerAd;
  var bannerLoaded = false.obs;

  Widget getBN(String name) {
    if (LoanData.value[name]["B_AD_TYPE"] == "ADMOB") {
      bannerAd = BannerAd(
        size: AdSize.fluid,
        adUnitId: LoanData.value[name]["B_ADMOB"],
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            bannerAd!.load();
            bannerLoaded.value = true;
            print("Banner ad Loaded${counter++}");
          },
          onAdFailedToLoad: (ad, error) {
            // print('banner onAdFailedToLoad ${counter++}');
          },
          onAdImpression: (ad) {
            print('banner onAdImpression ');
          },
        ),
        request: const AdRequest(),
      );
      bannerAd!.load();
    }
    return LoanData.value[name]["B_AD_TYPE"] == "ADMOB"
        ? Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: FacebookBannerAd(
                placementId: LoanData.value["B_FB"],
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {},
              ),
            ),
          );
  }
}
