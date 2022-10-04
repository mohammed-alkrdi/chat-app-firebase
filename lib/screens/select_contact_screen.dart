import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/controller/select_contact_controller.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';
import 'package:full_chat_firebase/widgets/error.dart';
import 'package:full_chat_firebase/widgets/loader.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = 'select-contact';
  const SelectContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CustomText(
          text: "Select contact",
          fontSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final contact = contactList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: CustomText(
                      text: contact.displayName,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    leading: contact.photo == null
                        ? null
                        : CircleAvatar(
                            backgroundImage: MemoryImage(
                              contact.photo!,
                            ),
                            radius: 30,
                          ),
                  ),
                );
              },
            ),
            error: (err, trace) => ErrorScreen(
              error: err.toString(),
            ),
            loading: (() => const Loader()),
          ),
    );
  }
}
