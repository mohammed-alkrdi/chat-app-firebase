import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/controller/auth_controller.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

class OtpScreen extends ConsumerWidget {
  static const String routeName = 'otp-screen';
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  void verfiyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verfiyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Verfiying your phone number",
          fontSize: 15,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomText(
            text: "We have sent an SMS with code",
            fontSize: 18,
            alignment: Alignment.center,
            color: LogoImageColor.logoColor4,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '- - - - - -',
                hintStyle: TextStyle(
                  color: LogoImageColor.logoColor4,
                  fontSize: 30,
                ),
                fillColor: LogoImageColor.logoColor4,
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                if (val.length == 6) {
                  verfiyOTP(
                    ref,
                    context,
                    val.trim(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
