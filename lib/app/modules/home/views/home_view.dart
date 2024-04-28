import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:telegram_chat_app/app/modules/call/views/call_view.dart';
import 'package:telegram_chat_app/app/modules/chat/views/chat_view.dart';
import 'package:telegram_chat_app/app/modules/profil/views/profil_view.dart';
import 'package:telegram_chat_app/app/modules/search/views/search_view.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  List pages = [
    const ChatView(),
    const SearchView(),
    Container(
      color: Colors.black,
    ),
    const CallView(),
    const ProfilView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: kGreyColor2,
        activeColor: kPrimaryColor,
        curveSize: 120,
        shadowColor: Colors.white,
        color: kPrimaryColor,
        items: const [
          TabItem(icon: Icon(IconlyLight.chat, color: kGreyColor), activeIcon: Icon(IconlyLight.chat, color: kPrimaryColor), isIconBlend: false),
          TabItem(icon: Icon(IconlyLight.search, color: kGreyColor), activeIcon: Icon(IconlyLight.search, color: kPrimaryColor), isIconBlend: false),
          TabItem(icon: Icon(CupertinoIcons.add, color: Colors.white), activeIcon: Icon(CupertinoIcons.add, color: Colors.white), isIconBlend: true),
          TabItem(icon: Icon(IconlyLight.call, color: kGreyColor), activeIcon: Icon(IconlyLight.call, color: kPrimaryColor), isIconBlend: false),
          TabItem(icon: Icon(IconlyLight.profile, color: kGreyColor), activeIcon: Icon(IconlyLight.profile, color: kPrimaryColor), isIconBlend: false),
        ],
        onTap: (int i) {
          _selectedIndex = i;

          setState(() {});
        },
      ),
    );
  }
}
