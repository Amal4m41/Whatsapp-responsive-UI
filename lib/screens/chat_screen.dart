import 'package:flutter/material.dart';

import '../components/chat_bubble_item.dart';
import '../data/dummy_chat_data.dart';
import '../theme_colors.dart';
import '../utils/widget_functions.dart';

class ChatScreen extends StatefulWidget {
  // final String contactName;
  // final List chatLog;
  // final String imgUrl;
  final bool isMobileLayout;
  final int id;

  const ChatScreen({
    Key? key,
    this.isMobileLayout = false,
    required this.id,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, dynamic>? selectedContactChatData;
  List? chatsLog;

  void _fetchContactChatData(int contactId) {
    print('fetch $contactId');
    selectedContactChatData = (chatsJson['friends'] as List)
        .where(
            (element) => (element as Map<String, dynamic>)["id"] == contactId)
        .first;
    _fetchAndSortChatLog();
  }

  void _fetchAndSortChatLog() {
    chatsLog =
        (selectedContactChatData!['chatlog'] as List<Map<String, dynamic>>)
            .toList();
    //
    // chatsLog!.sort(
    //     (a, b) => (a['message_id'] as int).compareTo(b['message_id'] as int));
    // chatsLog = chatsLog!.reversed.toList();
    print(chatsLog);
  }

  @override
  void initState() {
    print("INIT STATE");
    super.initState();
    _fetchContactChatData(widget.id);
  }

  @override
  void didUpdateWidget(covariant ChatScreen oldWidget) {
    print('DID UPDATE WIDGET');
    super.didUpdateWidget(oldWidget);
    if (oldWidget.id != widget.id) {
      _fetchContactChatData(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('BUILDING');
    return Scaffold(
      appBar: AppBar(
        // leading: Row(
        //   children: [
        //     Icon(Icons.arrow_back),
        //     Center(
        //       child: CircleAvatar(
        //         backgroundImage:
        //             NetworkImage(selectedContactChatData!['picture']),
        //         radius: 22,
        //       ),
        //     ),
        //   ],
        // ),
        leading: widget.isMobileLayout
            ? InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: widget.isMobileLayout,
        titleSpacing: widget.isMobileLayout ? -7 : null,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(selectedContactChatData!['picture']),
              radius: 22,
            ),
            getHorizontalSpace(8),
            Expanded(
              child: Text(
                selectedContactChatData!['name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ),
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/whatsapp_chat_bg_dark.png'),
                    fit: BoxFit.cover),
              ),
              padding: const EdgeInsets.all(8),
              child:
                  // ListView.builder(
                  //   // reverse: true,
                  //   itemCount: chatsLog!.length,
                  //   itemBuilder: (context, index) {
                  //     return ChatBubbleItem(
                  //       msgText: chatsLog![index]['text'],
                  //       date: chatsLog![index]['timestamp'],
                  //       isLeft: chatsLog![index]['side'] == 'left',
                  //     );
                  //   },
                  // ),
                  ListView(
                      reverse: true,
                      children: chatsLog!
                          .map(
                            (e) => ChatBubbleItem(
                              msgText: e['text'],
                              date: e['timestamp'],
                              isLeft: e['side'] == 'left',
                            ),
                          )
                          .toList()),
            ),
          ),
          // selectedContactChatData!['chatlog'] //TODO
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: ThemeColors.appBarColor,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: widget.isMobileLayout
                ? const MobileChatScreenBottomUI()
                : const WebChatScreenBottomUI(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {});
      // }),
    );
  }
}

Widget webChatTextField() {
  return TextFormField(
    decoration: InputDecoration(
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.all(Radius.circular(8)),
        // ),
        //OR
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        isDense: true,
        hintText: 'Type a message',
        hintStyle: const TextStyle(fontWeight: FontWeight.w100),
        filled: true,
        fillColor: Colors.blueGrey.shade800),
    // fillColor: ThemeColors.appBarColor.withOpacity(0.8)),
  );
}

class WebChatScreenBottomUI extends StatelessWidget {
  const WebChatScreenBottomUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getHorizontalSpace(6),
        const Icon(Icons.emoji_emotions_outlined, size: 28, color: Colors.grey),
        getHorizontalSpace(6),
        const Icon(
          Icons.attach_file,
          color: Colors.grey,
          size: 28,
        ),
        getHorizontalSpace(6),
        Expanded(child: webChatTextField()),
        getHorizontalSpace(6),
        const Icon(
          Icons.mic_rounded,
          color: Colors.grey,
          size: 28,
        ),
        getHorizontalSpace(6),
      ],
    );
  }
}

class MobileChatScreenBottomUI extends StatelessWidget {
  const MobileChatScreenBottomUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                // enabledBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.transparent),
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.transparent),
                //   borderRadius: BorderRadius.all(Radius.circular(8)),
                // ),
                //OR
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                prefixIcon: const Icon(Icons.emoji_emotions,
                    size: 28, color: Colors.grey),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      getHorizontalSpace(6),
                      const Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                        size: 25,
                      ),
                      getHorizontalSpace(5),
                      const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                isDense: true,
                hintText: 'Type a message',
                hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                filled: true,
                fillColor: Colors.blueGrey.shade800),
          ),
        ),
        getHorizontalSpace(6),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: ThemeColors.tabColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: const Icon(
            Icons.mic_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
        getHorizontalSpace(6),
      ],
    );
  }
}

Widget searchBar() {
  return TextFormField(
    decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        isDense: true,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 8.0, left: 5),
          child: Icon(Icons.search),
        ),
        contentPadding: const EdgeInsets.all(0),
        hintText: 'Search or start new chat',
        hintStyle: const TextStyle(fontWeight: FontWeight.w100),
        filled: true,
        fillColor: Colors.blueGrey.shade800),
    // fillColor: ThemeColors.appBarColor.withOpacity(0.8)),
  );
}
