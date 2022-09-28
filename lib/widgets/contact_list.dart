import 'package:flutter/material.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

import '../constances/info.dart';
import '../screens/chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: CustomText(
                      text: info[index]['name'].toString(),
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: CustomText(
                        text: info[index]['message'].toString(),
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        info[index]['profilePic'].toString(),
                      ),
                      radius: 30,
                    ),
                    trailing: CustomText(
                      text: info[index]['time'].toString(),
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
      ),
    );
  }
}
