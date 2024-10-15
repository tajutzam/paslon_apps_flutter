import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paslon_apps/pages/home.dart';
import 'package:paslon_apps/pages/splash.dart';

void main(List<String> args) {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        )
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        
      ),
    );
  }
}
