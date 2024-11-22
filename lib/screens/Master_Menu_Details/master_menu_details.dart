// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:textile_desktop_app/constants/footer_data.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/utils/colors.dart';

class MasterMenuDetailsScreen extends StatefulWidget {
  const MasterMenuDetailsScreen({super.key});

  @override
  State<MasterMenuDetailsScreen> createState() =>
      _MasterMenuDetailsScreenState();
}

class _MasterMenuDetailsScreenState extends State<MasterMenuDetailsScreen> {
  TextEditingController accountnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController acsesstypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController altAController = TextEditingController();
  TextEditingController altController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController groupnameController = TextEditingController();
  TextEditingController areanameController = TextEditingController();
  TextEditingController brokerCodeController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController extraDetailsController = TextEditingController();
  TextEditingController tinController = TextEditingController();
  TextEditingController eccController = TextEditingController();
  TextEditingController egstController = TextEditingController();
  TextEditingController pannumberController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController intRateController = TextEditingController();
  TextEditingController comisnController = TextEditingController();
  TextEditingController creditLimitController = TextEditingController();
  TextEditingController billDuedayController = TextEditingController();
  TextEditingController limitDaysController = TextEditingController();
  TextEditingController tdsRateController = TextEditingController();
  TextEditingController tdssectionController = TextEditingController();
  TextEditingController smsMoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController extraController = TextEditingController();
  TextEditingController cstNumberController = TextEditingController();
  TextEditingController adharNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? userId;
  getuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id');
    });
  }

  Future<void> insertData() async {
    try {
      // Create a map with all form field data
      Map<String, dynamic> formData = {
        "account_name": accountnameController.text,
        "name": nameController.text,
        "assesee_type": acsesstypeController.text,
        "address": addressController.text,
        "alt_a": altAController.text,
        "alt_c": altController.text,
        "city": cityController.text,
        "group_name": groupnameController.text,
        "area_name": areanameController.text,
        "broker_code": brokerCodeController.text,
        "phone_number": phonenumberController.text,
        "owner_name": ownerController.text,
        "extra_details": extraDetailsController.text,
        "tin_number": tinController.text,
        "ecc_number": eccController.text,
        "egst_number": egstController.text,
        "pan_number": pannumberController.text,
        "gst_number": gstController.text,
        "interest_rate": intRateController.text,
        "commission": comisnController.text,
        "credit_limit": creditLimitController.text,
        "bill_due_day": billDuedayController.text,
        "limit_days": limitDaysController.text,
        "tds_rate": tdsRateController.text,
        "tds_section": tdssectionController.text,
        "sms_mobile": smsMoController.text,
        "email": emailController.text,
        "extra": extraController.text,
        "cst_number": cstNumberController.text,
        "aadhar_number": adharNumberController.text,
        "date": dateController.text,
      };

      // Insert data into Firebase under the user's collection
      await FirebaseFirestore.instance
          .collection("Data")
          .doc(userId)
          .collection("AccountManager")
          .add(formData);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data successfully inserted!")),
      );
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error inserting data: $error")),
      );
    }
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  width: 10.w,
                ),
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
                SizedBox(
                  width: 15.w,
                ),
                customText(
                    text: "Weaving",
                    style: TextStyle(color: appColors.whiteColor)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                  text: "A/c. Name/ Group :",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
              const SizedBox(width: 10),
              customTextfiled(context, accountnameController),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          customdataFiled(context, "Name", nameController),
                          customdataFiled(
                              context, "Assesee Type", acsesstypeController),
                          customdataFiled(
                              context, "Address", addressController),
                          customdataFiled(
                              context, "Alt-A=A/C Copy", altAController),
                          customdataFiled(
                              context, "Alt-C=Adr Copy", altController),
                          customdataFiled(context, "City", cityController),
                          customdataFiled(
                              context, "Group Name", groupnameController),
                          customdataFiled(
                              context, "Area Name", areanameController),
                          customdataFiled(
                              context, "Broker Code", brokerCodeController),
                          customdataFiled(
                              context, "Phone Number", phonenumberController),
                          customdataFiled(
                              context, "Owner Name", ownerController),
                          customdataFiled(
                              context, "Extra Details", extraDetailsController),
                          customdataFiled(context, "Tin Number", tinController),
                          customdataFiled(context, "ECC Number", eccController),
                          customdataFiled(
                              context, "EGST Number", egstController),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Column(
                        children: [
                          customdataFiled(
                              context, "Pan Number", pannumberController),
                          customdataFiled(context, "GST Number", gstController),
                          customdataFiled(
                              context, "Int. Rate %", intRateController),
                          customdataFiled(
                              context, "Comisn %", comisnController),
                          customdataFiled(
                              context, "Credit Limit", creditLimitController),
                          customdataFiled(
                              context, "Bill Due Day", billDuedayController),
                          customdataFiled(
                              context, "O/s. Limit Day", limitDaysController),
                          customdataFiled(
                              context, "Tds Rate %", tdsRateController),
                          customdataFiled(
                              context, "Tds Section", tdssectionController),
                          customdataFiled(context, "Sms Mo.", smsMoController),
                          customdataFiled(context, "Email", emailController),
                          customdataFiled(context, "Extra", extraController),
                          customdataFiled(
                              context, "CST Number", cstNumberController),
                          customdataFiled(
                              context, "Aadhar Number", adharNumberController),
                          customdataFiled(context, "Date", dateController),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    insertData();
                  },
                  child: Text("Insert Data")),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
            ],
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

  Row customdataFiled(
      BuildContext context, String title, TextEditingController? controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: appColors.blueColor,
            ),
            child: Center(
              child: customText(
                  text: title, style: TextStyle(color: appColors.whiteColor)),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: customTextfiled(context, controller),
        )),
      ],
    );
  }

  SizedBox customTextfiled(
      BuildContext context, TextEditingController? controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 16,
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: appColors.blueColor,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: appColors.blueColor))),
        ),
      ),
    );
  }
}
