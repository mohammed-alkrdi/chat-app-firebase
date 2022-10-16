import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/controller/chat_controller.dart';
import 'package:full_chat_firebase/models/chat_contact.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';
import 'package:intl/intl.dart';
import '../../screens/chat_screen.dart';
import 'loader.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: StreamBuilder<List<ChatContact>>(
        stream: ref.watch(chatControllerProvider).chatContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var chatContactData = snapshot.data![index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ChatScreen.routeName,
                        arguments: {
                          'name' : chatContactData.name,
                          'uid' : chatContactData.contactId,
                        }
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: CustomText(
                          text: chatContactData.name,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: CustomText(
                            text: chatContactData.lastMessage,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              chatContactData.profilePic.replaceAll('\\', '/'),
                          ),
                          radius: 30,
                        ),
                        trailing: CustomText(
                          text: DateFormat.Hm().format(chatContactData.timeSent),
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: AppColors.dividerColor, indent: 85),
                ],
              );
            },
          );
        }
      ),
    );
  }
}
