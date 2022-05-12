import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD CONTACTS LIST');
    return ListView.separated(
      padding: EdgeInsets.only(top: 5),
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
        ),
        title: Text(
          'Messi',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text('dummy message', style: TextStyle(fontSize: 14)),
        ),
        trailing: Text('10:25 AM',
            style: TextStyle(fontSize: 11, color: Colors.grey)),
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 2,
        indent: 70,
        endIndent: 10,
        // color: ThemeColors.dividerColor,
      ),
    );
  }
}
