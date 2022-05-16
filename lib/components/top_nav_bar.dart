import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/screens/chat_screen.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';
import 'package:whatsapp_responsive_ui/utils/widget_functions.dart';

import '../screens/contacts_list_screen.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: ThemeColors.,
          elevation: 0,
          title: const Text(
            'WhatsApp',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.grey),
              padding: const EdgeInsets.only(right: 0),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.grey)),
          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: ThemeColors.tabColor,
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              indicatorColor: ThemeColors.tabColor,
              indicatorWeight: 2.5,
              tabs: [
                'CHATS',
                'STATUS',
                'CALLS',
              ]
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
        ),
        body: TabBarView(children: [
          ContactsListScreen(
              currentLayoutScreen: layout.mobileScreenLayout,
              onSelectChatContactMobileScreen: (int id) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            id: id,
                            isMobileLayout: true,
                          ))),
              onSelectChatContactWideScreen: (_) {}),
          Container(),
          Container(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ThemeColors.tabColor,
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
