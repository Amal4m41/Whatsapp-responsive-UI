import 'package:flutter/material.dart';
import 'package:whatsapp_responsive_ui/layouts/mobile_application_layout.dart';

import '../layouts/wide_screen_application_layout.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD HERE');
    return Container(
      child: LayoutBuilder(builder: (BuildContext context, constraint) {
        print('BUILD LAYOUT BUILDER');
        print('MaxWidth: ${constraint.maxWidth}');
        print('MinWidth: ${constraint.minWidth}');
        print('maxHeight: ${constraint.maxHeight}');
        print('minHeight: ${constraint.minHeight}');
        if (constraint.maxWidth > 800) {
          return WideScreenApplicationLayout();
        } else {
          return MobileApplicationLayout();
        }
      }),
    );
  }
}
