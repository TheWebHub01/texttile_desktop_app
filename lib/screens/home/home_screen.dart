import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isExpanded = [];

  List menuList = [
    {
      'image': 'assets/svg/Master.svg',
      'mainMenu': 'Master',
      'subMenu': [
        'Account Manager',
        'Item Master',
        'Area / Brk / Group Master',
        'Account Master List',
        'Item Master List',
        'Insurance Master',
        'Other All Master',
        'Shortcut Key Help',
        'Software Video Help',
        'Exit'
      ],
      'subMenuItems': {
        'Account Name Wise',
        'Schedule Wise',
        'City Wise',
        'Area Wise',
        'Broker Wise',
        'P.Group Wise',
        'Amc Date Fill',
        'Exit'
      }
    },
    {
      'image': 'assets/svg/Transactions.svg',
      'mainMenu': 'Transactions',
      'subMenu': [],
      'subMenuItems': [],
    },
    {
      'image': 'assets/svg/Reports unpress.svg',
      'mainMenu': 'Report',
      'subMenu': [],
      'subMenuItems': [],
    },
    {
      'image': 'assets/svg/Inventory unpress.svg',
      'mainMenu': 'Inventory',
      'subMenu': [],
      'subMenuItems': [],
    },
    {
      'image': 'assets/svg/Utilities unpress.svg',
      'mainMenu': 'Utilities',
      'subMenu': [],
      'subMenuItems': [],
    },
    {
      'image': 'assets/svg/exit unpress.svg',
      'mainMenu': 'Exit',
      'subMenu': [],
      'subMenuItems': [],
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the expanded states as false for all menus
    isExpanded = List<bool>.filled(menuList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: "Munjapara Fabrics",
                    style: TextStyle(color: appColors.blueColor)),
                const Spacer(),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.whiteColor)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            color: appColors.blueColor,
            child: Row(
              children: [
                customText(
                    text: "Ap+Eb+Pd [Single]",
                    style: TextStyle(color: appColors.whiteColor)),
                const Spacer(),
                customText(
                    text: "Account Master",
                    style: TextStyle(color: appColors.whiteColor)),
                const Spacer(),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.blueColor)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                  border: Border.all(color: appColors.blueColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      text: "Main Menu",
                      style: TextStyle(
                        color: appColors.blueColor,
                      )),
                  for (int i = 0; i < menuList.length; i++)
                    Container(
                      width: 280,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      padding:
                          const EdgeInsets.only(left: 20, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                        color: appColors.skyBlueColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: appColors.blueColor),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                menuList[i]['image'],
                                color: const Color(0xFF0D5785),
                              ),
                              const SizedBox(width: 20),
                              customText(
                                text: menuList[i]['mainMenu'],
                                style: const TextStyle(
                                  color: Color(0xFF0D5785),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle expansion only if subMenu is not empty
                                    if (menuList[i]['subMenu'].isNotEmpty) {
                                      isExpanded[i] = !isExpanded[i];
                                    }
                                  });
                                },
                                child: SvgPicture.asset(
                                  "assets/svg/down.svg",
                                  color: const Color(0xFF0D5785),
                                ),
                              ),
                            ],
                          ),
                          if (isExpanded[i])
                            for (String subMenu in menuList[i]['subMenu'])
                              Container(
                                width: 260,
                                margin: const EdgeInsets.only(
                                    left: 40, right: 10, bottom: 7),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: appColors.blueColor),
                                ),
                                child: customText(
                                  text: subMenu,
                                  style: TextStyle(color: appColors.blueColor),
                                ),
                              ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            color: const Color(0xFFF5FBFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                    text: "Service will expire in 28 days 30-09-2024",
                    style: TextStyle(color: appColors.blueColor)),
                customText(
                    text: "Munjapara Fabrics",
                    style: TextStyle(color: appColors.blueColor)),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.whiteColor)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            color: appColors.blueColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                    text: "Ap+Eb+Pd [Single]",
                    style: TextStyle(color: appColors.whiteColor)),
                customText(
                    text: "Account Master",
                    style: TextStyle(color: appColors.whiteColor)),
                customText(
                    text: "Register Id-[35M102]",
                    style: TextStyle(color: appColors.blueColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
