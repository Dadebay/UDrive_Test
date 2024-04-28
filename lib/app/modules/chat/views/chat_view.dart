import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:telegram_chat_app/constants/buttons/custom_user_button.dart';
import 'package:telegram_chat_app/constants/cards/chat_card.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: kBottomNavigationBarHeight,
          ),
          TabBarCustom(),
          Expanded(
              child: ListView.builder(
            itemCount: 12,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            itemBuilder: (BuildContext context, int index) {
              return ChatCard(index: index);
            },
          ))
        ],
      ),
    );
  }

  Widget TabBarCustom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          Container(
              width: 53.w,
              height: 53.h,
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(color: kGreyColor2, shape: BoxShape.circle),
              child: Image.asset(
                'assets/icons/user13.png',
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4.dg),
              decoration: const BoxDecoration(borderRadius: borderRadius30, color: kGreyColor2),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(25.0), color: kPrimaryColor),
                labelColor: Colors.white,
                splashBorderRadius: borderRadius25,
                indicatorColor: Colors.red,
                dividerHeight: 0,
                unselectedLabelColor: kGreyColor,
                labelStyle: TextStyle(fontFamily: gilroyMedium, fontSize: 14.sp),
                unselectedLabelStyle: TextStyle(fontFamily: gilroyRegular, fontSize: 14.sp),
                tabs: const [
                  Tab(
                    text: 'Message',
                  ),
                  Tab(
                    text: 'Group',
                  ),
                ],
              ),
            ),
          ),
          CustomUserButton(
            child: Icon(
              IconlyLight.notification,
              size: 18.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
