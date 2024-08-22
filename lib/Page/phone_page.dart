import 'package:fire_base_class/authentication/auth_services.dart';
import 'package:flutter/material.dart';
class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  TextEditingController _phoneController = TextEditingController();
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: "Phone Number",
            ),
          ),
          MaterialButton(
            minWidth: 300,
            color: Colors.red,
            onPressed: () async {
              _auth.sendOtp(_phoneController.text);
            },
            child: Text(
              "Send OTP",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
