import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:telegram_chat_app/app/modules/auth/views/create_account.dart';
import 'package:telegram_chat_app/app/modules/auth/views/login_page.dart';
import 'package:telegram_chat_app/constants/buttons/agree_button_view.dart';

import '../../../../constants/customWidget/constants.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  double _progress = 0.0;
  int page = 0;
  @override
  void _startProgress() {
    setState(() {
      _progress += 0.5;
      page++;
    });
  }

  List title = ['Make your way more comfortable', 'Solution for drivers striving for successful work', 'Your Successful Journey Starts Here'];

  List subtitle = [
    'Find the mechanic along the entire route without interruptiong your route using this platform',
    'Be part of a new era of work with this innovative app',
    'Take your drive carier to the next level with this app'
  ];
  List images = [
    'assets/image/carousel_1.png',
    'assets/image/carousel_2.png',
    'assets/image/carousel_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: page == 1 ? Colors.white : kPrimaryColor,
      body: Stack(
        children: [
          Positioned.fill(
              bottom: page == 1
                  ? Get.size.height / 2
                  : page == 2
                      ? Get.size.height / 2.5
                      : Get.size.height / 5,
              child: Padding(
                padding: EdgeInsets.all(page == 1 ? 20.0 : 0),
                child: Image.asset(
                  images[page],
                  fit: page == 1 ? BoxFit.contain : BoxFit.cover,
                ),
              )),
          Container(
              height: Get.size.height / 2,
              margin: EdgeInsets.only(top: Get.size.height / 2),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: Get.size.width,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title[page],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: gilroyBold,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    subtitle[page],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: gilroyMedium,
                      fontSize: 16,
                    ),
                  ),
                  page == 2 ? lastWidget() : nextButton(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Column lastWidget() {
    return Column(
      children: [
        AgreeButton(
            onTap: () {
              Get.to(() => LoginPage());
            },
            text: "Login to Account",
            color: false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Expanded(
                  child: SocialMediaIcon(
                onTap: () {},
                text: 'Google',
                image: "assets/icons/google.svg",
              )),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: SocialMediaIcon(
                onTap: () {},
                text: 'Apple',
                image: "assets/icons/apple.svg",
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const CreateAccountPage());
          },
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: 'New to udrive? ', style: TextStyle(color: Colors.grey, fontFamily: gilroyMedium)),
                TextSpan(text: 'Create Account', style: TextStyle(fontFamily: gilroyBold, color: kPrimaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector nextButton() {
    return GestureDetector(
      onTap: _startProgress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: kBlackColor, shape: BoxShape.circle),
              child: const Icon(IconlyLight.arrowRight, color: Colors.white, size: 30)),
          SizedBox(
            width: 90,
            height: 90,
            child: CircularProgressIndicator(
              backgroundColor: kGreyColor,
              value: _progress,
              strokeWidth: 1.5,
              valueColor: const AlwaysStoppedAnimation<Color>(kBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}
