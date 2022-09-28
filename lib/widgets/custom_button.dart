import 'package:flutter/material.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomText customtext;
  final Color color1;
  final Color color2;
  final double sizeHeight;
  final double sizeWidth;
  final void Function() onPressed;

  CustomButton(
      {Key? key,
      //required this.backColor,
      required this.sizeHeight,
      required this.onPressed,
      required this.customtext,
      required this.color1,
      required this.color2,
      required this.sizeWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight,
      width: sizeWidth,
      child: Container(
        decoration: BoxDecoration(
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
              BoxShadow(
                blurRadius: 1,
                offset: const Offset(0, 2),
                color: Colors.grey.withOpacity(0.2),
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [color1, color2]),
            borderRadius: BorderRadius.circular(40)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: onPressed,
          child: customtext,
        ),
      ),
    );
  }
}
