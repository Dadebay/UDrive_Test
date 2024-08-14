import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:telegram_chat_app/app/modules/auth/views/carousel_page.dart';
import 'package:telegram_chat_app/app/modules/auth/views/login_page.dart';
import 'package:telegram_chat_app/constants/buttons/agree_button_view.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

class CheckDriverAndMechanic extends StatelessWidget {
  const CheckDriverAndMechanic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(top: 80, right: 50, child: Center(child: SvgPicture.asset('assets/icons/logo_white.svg', width: 170, height: 170))),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.language,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: Get.size.width,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: gilroyBold,
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      "Choose how you will use the app for better experience",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: gilroyMedium,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: [
                        AgreeButton(
                            onTap: () {
                              Get.to(() => const CarouselPage());
                            },
                            color: false,
                            text: "I'm a driver"),
                        AgreeButton(
                            onTap: () {
                              Get.to(() => const CarouselPage());
                            },
                            color: true,
                            text: "I'm a mechanic"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginPage());
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.grey, fontFamily: gilroyMedium)),
                            TextSpan(text: 'Login', style: TextStyle(fontFamily: gilroyBold, color: kPrimaryColor)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
