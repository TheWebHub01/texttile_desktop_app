import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textile_desktop_app/constants/footer_data.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/screens/Account_Master_Details/account_master_details_screen.dart';
import 'package:textile_desktop_app/screens/Master_Menu_Details/master_menu_details.dart';
import 'package:textile_desktop_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isExpanded = [];
  int selectedSubMenuIndex = -1;
  List<GlobalKey> submenuKeys = [];

  List menuList = [
    {
      'image': 'assets/svg/Master.svg',
      'mainMenu': 'Master',
      'subMenu': [
        {'name': 'Account Manager', 'items': []},
        {'name': 'Item Master', 'items': []},
        {'name': 'Area / Brk / Group Master', 'items': []},
        {
          'name': 'Account Master List',
          'items': [
            'Account Name Wise',
            'Schedule Wise',
            'City Wise',
            'Area Wise',
            'Broker Wise',
            'P.Group Wise',
            'Amc Date Fill'
          ]
        },
        {'name': 'Item Master List', 'items': []},
        {'name': 'Insurance Master', 'items': []},
        {'name': 'Other All Master', 'items': []},
        {'name': 'Shortcut Key Help', 'items': []},
        {'name': 'Software Video Help', 'items': []},
        {'name': 'Exit', 'items': []},
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
    submenuKeys = List.generate(menuList.length, (_) => GlobalKey());
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
                const Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/more.svg")),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, bottom: 10),
                      child: customText(
                          text: "Main Menu",
                          style: TextStyle(
                              color: appColors.blueColor, fontSize: 20)),
                    ),
                    for (int i = 0; i < menuList.length; i++)
                      Container(
                        width: 280,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7),
                        padding:
                            const EdgeInsets.only(left: 20, top: 6, bottom: 6),
                        decoration: BoxDecoration(
                          color: isExpanded[i]
                              ? appColors.blueColor
                              : appColors.skyBlueColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: appColors.blueColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  menuList[i]['image'],
                                  color: isExpanded[i]
                                      ? const Color(0xFFC9EBFF)
                                      : const Color(0xFF0D5785),
                                ),
                                const SizedBox(width: 20),
                                customText(
                                  text: menuList[i]['mainMenu'],
                                  style: TextStyle(
                                      color: isExpanded[i]
                                          ? const Color(0xFFC9EBFF)
                                          : const Color(0xFF0D5785),
                                      fontSize: 15),
                                ),
                                const Spacer(),
                                TextButton(
                                  key: submenuKeys[i],
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
                                    color: isExpanded[i]
                                        ? const Color(0xFFC9EBFF)
                                        : const Color(0xFF0D5785),
                                  ),
                                ),
                              ],
                            ),
                            if (isExpanded[i])
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: appColors.blueColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    for (int j = 0;
                                        j < menuList[i]['subMenu'].length;
                                        j++)
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Align at the start
                                        children: [
                                          // Circle and Line (Stepper-like UI)
                                          Column(
                                            mainAxisSize: MainAxisSize
                                                .min, // Adjust size to fit content
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center, // Ensure centered alignment inside column
                                            children: [
                                              // Circle
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: selectedSubMenuIndex ==
                                                          j
                                                      ? appColors.whiteColor
                                                      : Colors
                                                          .transparent, // Filled if selected
                                                  border: Border.all(
                                                      color:
                                                          appColors.whiteColor),
                                                ),
                                              ),
                                              // Line (Only for non-last items)
                                              if (j !=
                                                  menuList[i]['subMenu']
                                                          .length -
                                                      1)
                                                Container(
                                                  width: 2,
                                                  height: 28,
                                                  color: appColors.whiteColor,
                                                ),
                                            ],
                                          ),
                                          // Spacing between circle and text
                                          const SizedBox(width: 10),
                                          // Submenu Text
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedSubMenuIndex = j;
                                                //click items name
                                              });
                                              if (menuList[i]['subMenu'][j]
                                                      ['items']
                                                  .isNotEmpty) {
                                                final RenderBox renderBox =
                                                    submenuKeys[i]
                                                            .currentContext!
                                                            .findRenderObject()
                                                        as RenderBox;
                                                final position = renderBox
                                                    .localToGlobal(Offset.zero);

                                                // Show the popup menu with the submenu position
                                                showMenu<String>(
                                                  color: Colors.white,
                                                  context: context,
                                                  position:
                                                      RelativeRect.fromLTRB(
                                                    position.dx, // x position
                                                    position.dy +
                                                        renderBox.size
                                                            .height, // y position
                                                    position.dx +
                                                        renderBox.size
                                                            .width, // width offset
                                                    50.0, // height offset
                                                  ),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20.0),
                                                    ),
                                                  ),
                                                  items: menuList[i]['subMenu']
                                                          [j]['items']
                                                      .map<
                                                          PopupMenuItem<
                                                              String>>(
                                                    (String item) {
                                                      return PopupMenuItem<
                                                          String>(
                                                        value: item,
                                                        child: Container(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 7,
                                                                horizontal: 5),
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: selectedSubMenuIndex == j
                                                                        ? appColors
                                                                            .blueColor
                                                                        : Colors
                                                                            .transparent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                color: selectedSubMenuIndex ==
                                                                        j
                                                                    ? Colors
                                                                        .transparent
                                                                    : appColors
                                                                        .blueColor),
                                                            child: customText(
                                                                text: item,
                                                                style: TextStyle(
                                                                  color: selectedSubMenuIndex ==
                                                                          j
                                                                      ? appColors
                                                                          .blackColor
                                                                      : appColors
                                                                          .whiteColor,
                                                                ),
                                                                textAlign: TextAlign.start)),
                                                      );
                                                    },
                                                  ).toList(),
                                                ).then((value) {
                                                  if (value != null) {
                                                    print('Selected: $value');
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AccountMasterDetailsScreen(
                                                                    title:
                                                                        "${menuList[i]['subMenu'][j]['name']} ($value) Report")));
                                                  }
                                                });
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MasterMenuDetailsScreen()));
                                              }
                                            },
                                            child: Transform.translate(
                                              offset: const Offset(0, -3),
                                              child: customText(
                                                text: menuList[i]['subMenu'][j]
                                                    ['name'],
                                                style: TextStyle(
                                                    color:
                                                        appColors.whiteColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            color: const Color(0xFFF5FBFF),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isNarrowScreen = constraints.maxWidth < 800;

                return isNarrowScreen
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          footerData("assets/svg/wp.svg", "+918320672006"),
                          const SizedBox(height: 10),
                          footerData(
                              "assets/svg/email.svg", "thewebhub@gmail.com"),
                          const SizedBox(height: 10),
                          footerData(
                              "assets/svg/telegram.svg", r"\FAS24\MFA2425\"),
                          const SizedBox(height: 10),
                          footerData("assets/svg/call.svg", "+918320672006"),
                        ],
                      )
                    : Row(
                        // Use Row for wider screens
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          footerData("assets/svg/wp.svg", "+918320672006"),
                          footerData(
                              "assets/svg/email.svg", "thewebhub@gmail.com"),
                          footerData(
                              "assets/svg/telegram.svg", r"\FAS24\MFA2425\"),
                          footerData("assets/svg/call.svg", "+918320672006"),
                        ],
                      );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            color: appColors.blueColor,
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isNarrowScreen = constraints.maxWidth < 800;

                return Row(
                  mainAxisAlignment: isNarrowScreen
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "410, Kedar Business Center, Dabholi to Bapasitaram Road, Katargam, Surat. 395004",
                        style: TextStyle(
                          color: appColors.whiteColor,
                          fontSize: isNarrowScreen ? 12 : 16,
                        ),
                        textAlign:
                            isNarrowScreen ? TextAlign.start : TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
