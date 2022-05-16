import 'package:flutter/material.dart';

class ContactsListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChatMsg;
  final String latestTimeStamp;
  const ContactsListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.lastChatMsg,
    required this.latestTimeStamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(lastChatMsg, style: const TextStyle(fontSize: 14)),
      ),
      trailing: Text(latestTimeStamp,
          style: const TextStyle(fontSize: 11, color: Colors.grey)),
    );
  }
}
