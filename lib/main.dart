
import 'package:fire_base_class/Page/home_page.dart';
import 'package:fire_base_class/Page/login_page.dart';
import 'package:fire_base_class/Page/otp_page.dart';
import 'package:fire_base_class/Page/phone_page.dart';
import 'package:fire_base_class/Page/regestration.dart';
import 'package:fire_base_class/Page/sign_up-page.dart';
import 'package:fire_base_class/firebase_options.dart';
import 'package:fire_base_class/firebase_services/view_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/SignInPage ',
      getPages: [
        GetPage(name: '/signup', page: ()=> RegistrationPage()),
        GetPage(name: '/signin', page: ()=> LoginPage()),
        GetPage(name: '/home', page: ()=> HomePage()),
        GetPage(name: '/phone', page: ()=> PhonePage()),
        GetPage(name: '/otp', page: ()=> OtpPage()),
        GetPage(name: '/ViewData', page: ()=> ViewData()),
        GetPage(name: '/SignInPage', page: ()=> SignInPage()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
