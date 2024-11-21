import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textile_desktop_app/utils/colors.dart';

TextFormField customTextField(String labelText, bool active,
    TextEditingController? controller, String? Function(String?)? validator) {
  return TextFormField(
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: active
              ? SvgPicture.asset("assets/svg/hide.svg")
              : Container(
                  height: 15,
                  width: 15,
                ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: appColors.textGreyColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        )),
  );
}
