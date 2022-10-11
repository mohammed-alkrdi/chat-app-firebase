import 'package:flutter/material.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/screens/auth/login_screen.dart';
import 'package:full_chat_firebase/widgets/custom_button.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomText(
              text: "Wellcome to ChatApp",
              color: LogoImageColor.logoColor4,
              fontSize: 30,
              fontWeight: FontWeight.w600,
              alignment: Alignment.center,
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              "assets/images/bg.png",
              height: 340,
              width: 340,
              color: LogoImageColor.logoColor4,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                customtext: const CustomText(
                  text: "Start And Continue",
                  fontSize: 15,
                  color: Colors.white,
                ),
                color1: LogoImageColor.logoColor1,
                color2: LogoImageColor.logoColor4,
                sizeHeight: 50,
                sizeWidth: 200,
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
