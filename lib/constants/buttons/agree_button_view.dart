// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:telegram_chat_app/app/home/controllers/home_controller.dart';

import '../customWidget/constants.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool color;

  AgreeButton({super.key, required this.onTap, required this.text, required this.color});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: animatedContaner());
  }

  Widget animatedContaner() {
    return Obx(() {
      return AnimatedContainer(
        decoration: BoxDecoration(borderRadius: borderRadius30, border: Border.all(color: color ? Colors.black : kPrimaryColor), color: color ? Colors.white : kPrimaryColor),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: homeController.agreeButton.value ? 0 : 10.h),
        width: homeController.agreeButton.value ? 60.w : Get.size.width,
        duration: const Duration(milliseconds: 800),
        child: homeController.agreeButton.value
            ? Center(
                child: SizedBox(
                  width: 34.w,
                  height: 29.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                text.tr,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: color ? Colors.black : Colors.white, fontFamily: gilroyBold, fontSize: 22.sp),
              ),
      );
    });
  }
}

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.onTap, required this.text, required this.image});
  final Function() onTap;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: borderRadius30, border: Border.all(color: Colors.black), color: Colors.white),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text.tr,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontFamily: gilroyBold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
