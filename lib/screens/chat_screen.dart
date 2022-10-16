import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/controller/auth_controller.dart';
import 'package:full_chat_firebase/models/user_model.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';
import 'package:full_chat_firebase/widgets/screens/loader.dart';

import '../widgets/button_chat_field.dart';
import '../widgets/screens/chat_list.dart';

class ChatScreen extends ConsumerWidget {
  static const String routeName = 'chat-screen';
  final String name;
  final String uid;

  const ChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: StreamBuilder<UserModel>(
          stream: ref.read(authControllerProvider).userDataById(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: 20,
                ),
                CustomText(
                  text: snapshot.data!.isOnline ? 'online' : 'offline',
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ],
            );
          },
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
        children: [
          Expanded(
            child: ChatList(
              receiverUserId: uid,
            ),
          ),
          ButtonChatField(
            receiverUserId: uid,
          ),
        ],
      ),
    );
  }
}
