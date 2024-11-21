// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_desktop_app/constants/progress_loader/progress_loader.dart';
import 'package:textile_desktop_app/constants/textformfield/custom_textform_field.dart';
import 'package:textile_desktop_app/constants/texts/text.dart';
import 'package:textile_desktop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:textile_desktop_app/screens/home/home_screen.dart';
import 'package:textile_desktop_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkBoxValue = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Future<void> loginUser(
  //     String email, String password, BuildContext context) async {
  //   // Trim inputs
  //   email = email.trim();
  //   password = password.trim();

  //   if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
  //     return; // Exit if form is not valid
  //   }

  //   try {
  //     // Sign in with Firebase Auth
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);

  //     // Store email in SharedPreferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('email', email);

  //     // Navigate to the next screen
  //     if (context.mounted) {
  //       await Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomeScreen()),
  //       );
  //     }

  //     // Show success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Welcome back, $email!'),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     // Handle specific FirebaseAuth errors
  //     print("=========>$e");
  //     String errorMessage = 'An error occurred. Please try again.';
  //     if (e.code == 'user-not-found') {
  //       errorMessage = 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       errorMessage = 'Incorrect password.';
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(errorMessage),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //   } catch (e) {
  //     // Handle unexpected errors
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('An unexpected error occurred: $e'),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }
  getuser() async {
    var map = await Firestore.instance.collection("users").get();
    print("== map ==>${map}");
  }

  login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var user = await auth.signIn(
        _emailController.text,
        _passwordController.text,
      );
      print('User signed in: ${user.email}');
      print('User signed in: ${user.id}');

      // Store the user email and ID in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', user.email!);
      await prefs.setString('user_id', user.id!);

      // Navigate to the home screen after successful login
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      print('Error during login: $e');
    }
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

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
                        SizedBox(
                          height: 5.h,
                        ),
                        customText(
                            text: "Welcome Back",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500)),
                        customText(
                            text: "Join a Company",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal,
                                color: appColors.greyColor)),
                        SizedBox(
                          height: 4.h,
                        ),
                        customTextField(
                            "Enter Your E-mail", false, _emailController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Regex for email validation
                          String pattern =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        }),
                        SizedBox(
                          height: 3.h,
                        ),
                        customTextField(
                            "Enter Your Password", true, _passwordController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: checkBoxValue,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    checkBoxValue = newValue!;
                                  });
                                }),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff8C8C8C)),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: const Color(0xFF8C8C8C)),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await pl.show();
                                  await login();
                                  await pl.hide();
                                }
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => HomeScreen(),
                                //     ));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: appColors.blueColor),
                                child: Center(
                                  child: customText(
                                      text: "Log In",
                                      style: TextStyle(
                                          color: appColors.whiteColor,
                                          fontSize: 11.sp)),
                                ),
                              ),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: appColors.blueColor)),
                              child: Center(
                                child: customText(
                                    text: "Join as Member",
                                    style: TextStyle(
                                        color: appColors.blueColor,
                                        fontSize: 11.sp)),
                              ),
                            )),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
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
                    children: [SvgPicture.asset("assets/svg/login_logo.svg")],
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
