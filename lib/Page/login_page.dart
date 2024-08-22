import 'package:fire_base_class/authentication/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthServices _auth = AuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              minWidth: 300,
              color: Colors.blue,
              onPressed: () async {
                User? user = await _auth.signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                if (user != null) {
                  Get.snackbar("Success", "Login Successful");
                  Get.offAllNamed('/home');
                } else {
                  Get.snackbar(
                    "Sorry",
                    "There has been a problem, try again",
                  );
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              minWidth: 300,
              color: Colors.red,
              onPressed: () async {
                _auth.signInWithGoogle();
              },
              child: Text(
                "Login with Google",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              minWidth: 300,
              color: Colors.green,
              onPressed: () async {
                Get.toNamed('/phone');
              },
              child: Text(
                "Login with Phone Number",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/signup');
              },
              child: Text("Do not have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
