import 'package:fire_base_class/authentication/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            MaterialButton(
              minWidth: 300,
              color: Colors.blue,
              onPressed: () async {
                // _auth.logout();
                _auth.google_signout();
                Get.offAllNamed('/SignInPage');
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
