import 'package:flutter/material.dart';

import 'profile_icon.dart';

class ProfileInfo extends StatelessWidget {
  AppIcons appIcons;
  final String text;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? color;
  //Function(String? value) onSaved;
  //String? Function(String? value) validator;

  ProfileInfo(
      {Key? key,
      required this.appIcons,
      required this.text,
      required this.inputType,
      required this.inputAction,
      this.color,
      //required this.onSaved,
      //equired this.validator,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: appIcons,
            ),
            hintText: text,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: controller,
          //onSaved: onSaved,
          //validator: validator,
        ),
      ),
    );
  }
}
