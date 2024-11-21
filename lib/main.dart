import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:textile_desktop_app/screens/Authentication/register_screen.dart';
import 'package:textile_desktop_app/screens/Master_Menu_Details/master_menu_details.dart';
import 'package:textile_desktop_app/utils/colors.dart';

const apiKey = 'AIzaSyAI599y1m2ZaNWd12EJQYT_3zB8cUHO8Ps';
const projectId = 'textile-app-eed16';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp(
  //       // options: DefaultFirebaseOptions.currentPlatform,
  //       );
  //   print("Firebase initialized successfully");
  // } catch (e) {
  //   print("Firebase initialization failed: $e");
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const MasterMenuDetailsScreen(),
      ),
    );
  }
}
