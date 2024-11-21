import 'package:flutter/material.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/utils/colors.dart';

class AccountMasterDetailsScreen extends StatefulWidget {
  String title;
  AccountMasterDetailsScreen({super.key, required this.title});

  @override
  State<AccountMasterDetailsScreen> createState() =>
      _AccountMasterDetailsScreenState();
}

class _AccountMasterDetailsScreenState
    extends State<AccountMasterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            color: appColors.blueColor,
            child: Row(
              children: [
                customText(
                    text: "Update: 02-02-2024 (11:58)",
                    style: TextStyle(color: appColors.whiteColor)),
                const Spacer(),
                customText(
                    text: "A/C Year 01-04-2024 To 31-03-2025",
                    style: TextStyle(color: appColors.whiteColor)),
                const Spacer(),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.whiteColor)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            color: const Color(0xFFF5FBFF),
            child: Row(
              children: [
                customText(
                    text: "Service will expire in 28 days 30-09-2024",
                    style: TextStyle(color: appColors.blueColor)),
                const Spacer(),
                customText(
                    text: widget.title,
                    style: TextStyle(color: appColors.blueColor)),
                const Spacer(),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.whiteColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
