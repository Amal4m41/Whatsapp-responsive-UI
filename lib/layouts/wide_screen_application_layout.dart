import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/screens/contacts_list_screen.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';

class WideScreenApplicationLayout extends StatelessWidget {
  const WideScreenApplicationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              leading: Center(
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
                  child: Text('SEARCH BAR HERE'),
                ),
                Expanded(
                  child: ContactsListScreen(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Scaffold(
                appBar: AppBar(
                  leading: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                    ),
                  ),
                  title: Column(
                    children: [
                      Text(
                        "Dummy name here",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Text('click '),
                    ],
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
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      color: ThemeColors.appBarColor,
                      child: Row(
                        children: [
                          Icon(Icons.emoji_emotions_outlined,
                              color: Colors.grey),
                          Icon(
                            Icons.attach_file,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  // border: Icons.border_top_outlined.al
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.mic_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}
