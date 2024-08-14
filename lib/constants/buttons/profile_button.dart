// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

class ProfilButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final IconData icon;
  const ProfilButton({
    required this.name,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        tileColor: kGreyColor2,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius15),
        minVerticalPadding: 23,
        title: Text(
          name.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.2), borderRadius: borderRadius15),
          child: Icon(icon, color: kPrimaryColor),
        ),
        trailing: const Icon(IconlyLight.arrowRightCircle, color: kPrimaryColor),
      ),
    );
  }
}
