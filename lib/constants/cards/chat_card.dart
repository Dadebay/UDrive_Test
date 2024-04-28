import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

class ChatCard extends StatelessWidget {
  ChatCard({super.key, required this.index});
  final List<Color> colors = [
    const Color(0xffC2FFB9), // Bright Lime Green
    const Color(0xffB977D6), // Vivid Purple
    const Color(0xffD3D9DC), // Pale Grey
    const Color(0xffA74DBD), // Rich Purple
    const Color(0xffFF6B4E), // Fiery Red-Orange
    const Color(0xff00D9B7), // Turquoise Teal
    const Color(0xffFFC94E), // Sunset Gold
    const Color(0xff5EE68A), // Minty Fresh Green
    const Color(0xff54A0E8), // Sky Blue
    const Color(0xffFFD700), // Golden Yellow
    const Color(0xffE6A8E8), // Lavender Bliss
    const Color(0xffA0522D) // Warm Chocolate Brown
  ];
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      decoration: const BoxDecoration(borderRadius: borderRadius15, color: kGreyColor2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 50.w,
              height: 50.h,
              margin: EdgeInsets.only(right: 10.w),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: colors[index], shape: BoxShape.circle),
              child: Image.asset(
                'assets/icons/user${index + 1}.png',
                fit: BoxFit.contain,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gurbanow Dadebay",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 14.sp),
                ),
                Text(
                  "This is last message of this user",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: kGreyColor, fontFamily: gilroyRegular, fontSize: 12.sp),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "11:23 PM",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kGreyColor, fontFamily: gilroyMedium, fontSize: 12.sp),
              ),
              Container(
                width: 15.w,
                height: 15.h,
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, fontSize: 12.sp),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
