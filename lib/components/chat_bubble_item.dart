import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';
import 'package:whatsapp_responsive_ui/utils/widget_functions.dart';

class ChatBubbleItem extends StatelessWidget {
  final bool isLeft;
  final String msgText;
  final String date;
  const ChatBubbleItem({
    Key? key,
    required this.isLeft,
    required this.msgText,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        isLeft ? getHorizontalSpace(0) : Expanded(child: getHorizontalSpace(0)),
        Container(
          constraints: BoxConstraints(
            maxWidth: (width / 3) * 2 - width * 0.05,
            minWidth: 100,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: isLeft
                ? const BorderRadius.all(Radius.circular(10))
                    .copyWith(topLeft: const Radius.circular(0))
                : const BorderRadius.all(Radius.circular(10))
                    .copyWith(topRight: const Radius.circular(0)),
            color: isLeft
                ? ThemeColors.messageColorLeft
                : ThemeColors.messageColorRight,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  msgText,
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontSize: 10),
                    ),
                    getHorizontalSpace(5),
                    const Icon(
                      Icons.done_all_outlined,
                      size: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
          // alignment: Alignment.bottomRight,
        ),
      ],
    );
  }
}
