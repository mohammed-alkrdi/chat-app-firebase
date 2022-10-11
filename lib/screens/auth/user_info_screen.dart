import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/controller/auth_controller.dart';
import 'package:full_chat_firebase/widgets/custom_button.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

import '../../constances/utils.dart';
import '../../widgets/profile_icon.dart';
import '../../widgets/profile_info.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = 'user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void saveUserData() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
            email,
            image,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/chat-app.png',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: "chat app name",
              color: LogoImageColor.logoColor4,
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: LogoImageColor.logoColor4,
              ),
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  image == null
                      ? const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/person-icon-8.png'),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: FileImage(image!),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 64,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ProfileInfo(
              appIcons: AppIcons(
                icon: Icons.person,
                backgroundColor: LogoImageColor.logoColor4,
                iconColor: Colors.white,
                size: 50,
                iconSize: 25,
              ),
              text: 'name',
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              controller: nameController,
              // validator: (val) {},
              //onSaved: (val) {},
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileInfo(
              appIcons: AppIcons(
                icon: Icons.email,
                backgroundColor: LogoImageColor.logoColor4,
                iconColor: Colors.white,
                size: 50,
                iconSize: 25,
              ),
              text: 'email',
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              controller: emailController,
              // validator: (val) {},
              //onSaved: (val) {},
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: saveUserData,
              color1: LogoImageColor.logoColor1,
              color2: LogoImageColor.logoColor4,
              customtext: const CustomText(
                text: "Done",
                color: Colors.white,
                fontSize: 15,
              ),
              sizeHeight: 50,
              sizeWidth: 200,
            ),
          ],
        ),
      ),
    );
  }
}
