import 'package:flutter/material.dart';

enum layout { mobileScreenLayout, wideScreenLayout }

SizedBox getHorizontalSpace(double value) {
  return SizedBox(width: value);
}

SizedBox getVerticalSpace(double value) {
  return SizedBox(height: value);
}
