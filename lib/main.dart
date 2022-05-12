import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/theme_colors.dart';
import 'package:whatsapp_responsive_ui/utils/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("build MY APP");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp UI clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ThemeColors.backgroundColor,
        ),
        home: const ResponsiveWidget());
  }
}
