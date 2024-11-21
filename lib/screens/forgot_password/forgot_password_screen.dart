import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:textile_desktop_app/constants/textformfield/custom_textform_field.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/utils/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Card(
          elevation: 20,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: appColors.whiteColor,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset("assets/svg/close.svg")),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 5.h,
                        ),
                        customText(
                            text: "Forgot Password?",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        customText(
                            text:
                                "No worries, we’ll send you reset instruction.",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal,
                                color: appColors.greyColor)),
                        SizedBox(
                          height: 4.h,
                        ),
                        customTextField(
                            "Enter Your Password", false, _passwordController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }),
                        SizedBox(
                          height: 3.h,
                        ),
                        customTextField("Enter Your Confirm Password", true,
                            _confirmpasswordController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () async {
                                // await pl.show();
                                // await loginUser(_emailController.text,
                                //     _passwordController.text, context);
                                // await pl.hide();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: appColors.blueColor),
                                child: Center(
                                  child: customText(
                                      text: "Reset Password",
                                      style: TextStyle(
                                          color: appColors.whiteColor,
                                          fontSize: 12.sp)),
                                ),
                              ),
                            )),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: appColors.skyBlueColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/forgotpassword_logo.svg")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
