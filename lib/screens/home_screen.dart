import 'package:flutter/material.dart';
import 'package:full_chat_firebase/constances/colors.dart';
import 'package:full_chat_firebase/screens/chat_screen.dart';
import 'package:full_chat_firebase/widgets/contact_list.dart';
import 'package:full_chat_firebase/widgets/custom_text.dart';

import '../widgets/drawer_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 250,
                color: LogoImageColor.logoColor4,
                child: Container(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
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
                onPressed: () {
                  //Get.to(() => const ProfileScreen(),
                  //transition: Transition.size);
                },
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
                onPressed: () {
                  //Get.to(() => const SettingsScreen(),
                  //transition: Transition.circularReveal);
                },
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
          //backgroundColor: AppColors.appBarColor,
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
                ))
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ));
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
