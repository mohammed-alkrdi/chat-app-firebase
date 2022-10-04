import 'package:flutter/material.dart';
import 'package:full_chat_firebase/constances/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: LogoImageColor.logoColor4,
      ),
    );
  }
}
