import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/controller/auth_controller.dart';
import 'package:full_chat_firebase/screens/select_contact_screen.dart';
import 'package:full_chat_firebase/widgets/screens/contact_list.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';
import '../widgets/drawer_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final postModel = ref.read(userDataAuthProvider).asData;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                color: LogoImageColor.logoColor4,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                right: 200,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${postModel?.value!.profilePic.replaceAll('\\', '/')}"),
                                radius: 38,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 230, bottom: 50),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.dark_mode,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: postModel?.value!.name ?? "",
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: postModel?.value!.phoneNumber ?? "",
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerTile(
                select: true,
                selectedColor: LogoImageColor.logoColor4,
                textInput: const CustomText(
                  text: "Groups",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                icon: Icons.group,
                onPressed: () {},
              ),
              DrawerTile(
                select: true,
                selectedColor: LogoImageColor.logoColor4,
                textInput: const CustomText(
                  text: "Profile",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                icon: Icons.person,
                onPressed: () {},
              ),
              DrawerTile(
                select: true,
                selectedColor: LogoImageColor.logoColor4,
                textInput: const CustomText(
                  text: "Settings",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                icon: Icons.settings,
                onPressed: () {},
              ),
              DrawerTile(
                select: true,
                selectedColor: LogoImageColor.logoColor4,
                textInput: const CustomText(
                  text: "Log out",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                icon: Icons.logout,
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: false,
          title: const CustomText(
            text: "ChatApp",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SelectContactScreen.routeName);
          },
          backgroundColor: LogoImageColor.logoColor4,
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
