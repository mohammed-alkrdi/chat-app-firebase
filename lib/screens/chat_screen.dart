import 'package:flutter/material.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/constances/info.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

import '../widgets/chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColors.appBarColor,
        centerTitle: false,
        //elevation: 0,
        title: CustomText(
          text: info[0]['name'].toString(),
          fontSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatList(),
          ),
        ],
      ),
      bottomNavigationBar: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: LogoImageColor.logoColor4,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.emoji_emotions,
              color: Colors.white,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                Icon(
                  Icons.attach_file,
                  color: Colors.white,
                ),
                Icon(
                  Icons.money,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          hintText: 'Message',
          hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
        onChanged: (value) {},
        validator: (value) {},
      ),
    );
  }
}
