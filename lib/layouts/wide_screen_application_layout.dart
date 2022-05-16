import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/components/chat_bubble_item.dart';
import 'package:whatsapp_responsive_ui/screens/chat_screen.dart';
import 'package:whatsapp_responsive_ui/screens/contacts_list_screen.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';
import 'package:whatsapp_responsive_ui/utils/widget_functions.dart';

import '../data/dummy_chat_data.dart';

class WideScreenApplicationLayout extends StatefulWidget {
  const WideScreenApplicationLayout({Key? key}) : super(key: key);

  @override
  State<WideScreenApplicationLayout> createState() =>
      _WideScreenApplicationLayoutState();
}

class _WideScreenApplicationLayoutState
    extends State<WideScreenApplicationLayout> {
  // Map<String, dynamic>? selectedContactChatData;
  int _selectContactId = 2;

  // void _fetchContactChatData(int contactId) {
  //   selectedContactChatData = (chatsJson['friends'] as List)
  //       .where(
  //           (element) => (element as Map<String, dynamic>)["id"] == contactId)
  //       .first;
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    // _fetchContactChatData(2);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              leading: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat, color: Colors.grey),
                  padding: const EdgeInsets.only(right: 0),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.grey)),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: searchBar(),
                ),
                Expanded(
                  child: ContactsListScreen(
                    currentLayoutScreen: layout.wideScreenLayout,
                    onSelectChatContactWideScreen: (int id) {
                      setState(() {
                        _selectContactId = id;
                      });
                    },
                    onSelectChatContactMobileScreen: (_) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ChatScreen(
            id: _selectContactId,
          ),
        )
      ],
    );
  }
}
