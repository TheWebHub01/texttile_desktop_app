import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/auth/token_store.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_desktop_app/screens/Authentication/register_screen.dart';
import 'package:textile_desktop_app/screens/home/home_screen.dart';
import 'package:textile_desktop_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

const apiKey = 'AIzaSyAI599y1m2ZaNWd12EJQYT_3zB8cUHO8Ps';
const projectId = 'textile-app-eed16';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: apiKey,
          appId: '1:899109364547:web:a8a2ccde4a25368d43c5f6',
          messagingSenderId: '899109364547',
          projectId: projectId));
  // FirebaseAuth.initialize(
  //     'AIzaSyAI599y1m2ZaNWd12EJQYT_3zB8cUHO8Ps', VolatileStore());
  // Firestore.initialize(projectId);

  // // Check if user is already logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('user_email');
  String? userId = prefs.getString('user_id');

  // Run the app with the appropriate screen based on the login state
  runApp(MyApp(isLoggedIn: userEmail != null && userId != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "MPLUS1",
          scaffoldBackgroundColor: appColors.whiteColor,
          colorScheme: ColorScheme.fromSeed(seedColor: appColors.blueColor),
          useMaterial3: true,
        ),
        home: isLoggedIn ? const HomeScreen() : const RegisterScreen(),
      ),
    );
  }
}
