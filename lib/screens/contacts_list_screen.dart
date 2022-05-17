import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/components/contacts_list_item.dart';
import 'package:whatsapp_responsive_ui/data/dummy_chat_data.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';

import '../utils/widget_functions.dart';

class ContactsListScreen extends StatelessWidget {
  final layout currentLayoutScreen;
  final void Function(int) onSelectChatContactWideScreen;
  final void Function(int) onSelectChatContactMobileScreen;

  const ContactsListScreen({
    Key? key,
    required this.currentLayoutScreen,
    required this.onSelectChatContactWideScreen,
    required this.onSelectChatContactMobileScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD CONTACTS LIST');
    final List<Map<String, dynamic>> contactsList =
        chatsJson['profile']['friends'];
    return ListView.separated(
      padding: EdgeInsets.only(top: 5),
      itemCount: contactsList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          currentLayoutScreen == layout.mobileScreenLayout
              ? onSelectChatContactMobileScreen(contactsList[index]["id"])
              : onSelectChatContactWideScreen(contactsList[index]["id"]);
        },
        child: ContactsListItem(
          imageUrl: contactsList[index]["picture"],
          name: contactsList[index]["name"],
          lastChatMsg: contactsList[index]['lastChat'],
          latestTimeStamp: contactsList[index]['latest_timestamp'],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 3,
        indent: 70,
        endIndent: 10,
        // color: ThemeColors.dividerColor,
      ),
    );
  }
}
