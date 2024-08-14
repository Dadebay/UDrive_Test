import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:telegram_chat_app/app/home/views/home_view.dart';
import 'package:telegram_chat_app/app/modules/auth/views/create_account.dart';
import 'package:telegram_chat_app/constants/buttons/agree_button_view.dart';
import 'package:telegram_chat_app/constants/customWidget/constants.dart';
import 'package:telegram_chat_app/constants/customWidget/custom_text_field.dart';
import 'package:telegram_chat_app/constants/customWidget/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = TextEditingController();

  TextEditingController textEditingController1 = TextEditingController();

  FocusNode focusNode = FocusNode();

  FocusNode focusNode1 = FocusNode();
  bool _rememberMe = false;
  final login = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c2048),
      body: Stack(
        children: [
          logoPart(),
          Container(
              height: Get.size.height / 1.5,
              margin: EdgeInsets.only(top: Get.size.height / 2.5),
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
              width: Get.size.width,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
              child: Form(
                key: login,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      labelName: "Email or phone number",
                      controller: textEditingController,
                      focusNode: focusNode,
                      requestfocusNode: focusNode1,
                    ),
                    CustomTextField(
                      labelName: "Password",
                      controller: textEditingController1,
                      focusNode: focusNode1,
                      requestfocusNode: focusNode,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.grey.shade300,
                                activeColor: kPrimaryColor,
                                shape: const RoundedRectangleBorder(borderRadius: borderRadius5),
                                side: BorderSide(width: 0.8, color: Colors.grey.shade500),
                                overlayColor: WidgetStateProperty.all(kPrimaryColor),
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              const Text('Remember Me'),
                            ],
                          ),
                        ),
                        TextButton(onPressed: () {}, child: const Text('Forgot Password?'))
                      ],
                    ),
                    lastWidget(),
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
                ),
              ))
        ],
      ),
    );
  }

  Widget logoPart() {
    return SizedBox(
      height: Get.size.height / 2,
      width: Get.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(borderRadius: borderRadius30, color: Colors.white),
              child: SvgPicture.asset('assets/icons/logo.svg', width: 70, height: 70)),
          const Text(
            "Welcome Back !",
            style: TextStyle(
              color: Colors.white,
              fontFamily: gilroyBold,
              fontSize: 30,
            ),
          ),
          const Text(
            "Please login first to start your UDrive",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: gilroyMedium,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Column lastWidget() {
    return Column(
      children: [
        AgreeButton(
            onTap: () {
              if (login.currentState!.validate()) {
                if (textEditingController.text == 'Gurbanow' && textEditingController1.text == 'dadebay') {
                  Get.to(() => const HomeView());
                } else {
                  showSnackBar('Error', 'Email or password is incorrect', Colors.red);
                  textEditingController.clear();
                  textEditingController1.clear();
                }
              } else {
                showSnackBar('Error', 'Please fill the TextFields', Colors.red);
              }
            },
            text: "Login",
            color: false),
        Row(
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
      ],
    );
  }
}
