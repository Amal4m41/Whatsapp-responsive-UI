import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/components/top_nav_bar.dart';

class MobileApplicationLayout extends StatelessWidget {
  const MobileApplicationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MOBILE LAYOUT BUILD');
    return TopNavBar();
  }
}
