import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/utils/colors.dart';

Row footerData(String imagePath, String title) {
  return Row(
    children: [
      SvgPicture.asset(
        imagePath,
        height: 20,
        width: 20,
      ),
      SizedBox(
        width: 5,
      ),
      customText(text: title, style: TextStyle(color: appColors.blueColor)),
    ],
  );
}
