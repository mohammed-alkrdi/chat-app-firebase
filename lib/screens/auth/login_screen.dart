import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/constances/utils.dart';
import 'package:full_chat_firebase/controller/auth_controller.dart';
import 'package:full_chat_firebase/widgets/custom_button.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';
import 'package:country_picker/country_picker.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    final String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: "Fill out all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/chat-app-logo-icon-vector-removebg-preview.png",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                fontSize: 30,
                text: "Chat App",
                color: LogoImageColor.logoColor4,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                fontSize: 14,
                text: "Chat App will need to verify your phone number",
                color: LogoImageColor.logoColor4,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: pickCountry,
                child: CustomText(
                  text: "Pick country",
                  color: LogoImageColor.logoColor4,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  if (country != null)
                    CustomText(
                      text: "+${country!.phoneCode}",
                      color: LogoImageColor.logoColor4,
                      alignment: Alignment.bottomLeft,
                      fontSize: 16,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(color: LogoImageColor.logoColor4),
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'phone number',
                        hintStyle: TextStyle(
                          color: LogoImageColor.logoColor4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SizedBox(
                width: 90,
                child: CustomButton(
                  color1: LogoImageColor.logoColor1,
                  color2: LogoImageColor.logoColor4,
                  sizeHeight: 50,
                  sizeWidth: 200,
                  customtext: const CustomText(
                    text: "Next",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  onPressed: sendPhoneNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
