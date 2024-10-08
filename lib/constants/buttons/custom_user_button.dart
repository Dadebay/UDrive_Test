import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

class CustomUserButton extends StatelessWidget {
  const CustomUserButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container(width: 53.w, height: 53.h, decoration: const BoxDecoration(color: kGreyColor2, shape: BoxShape.circle), child: child));
  }
}
