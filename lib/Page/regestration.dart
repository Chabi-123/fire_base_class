import 'package:fire_base_class/authentication/auth_services.dart';
import 'package:fire_base_class/constant/constant_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  AuthServices _auth = AuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  bool isPasswordObs = true;
  bool isRePasswordObs = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.15,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: -70,
                      right:-60 ,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Positioned(
                      right:330 ,
                      top: -45,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 30,color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
          
                    ),
                    Positioned(
                      right:250 ,
                      top: -90,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 23,),
                  Text('Sign Up',style: myStyle(30,Colors.black,FontWeight.w900),),
                ],
              ),
              Gap(10),
              Padding(
                padding: EdgeInsets.only(right: 12,left: 12),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        label: Text("Name",style: myStyle(18),),
                        hintText: "Name",
                        // hintStyle: TextStyle(color: Colors.purple)
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                    Gap(30),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: Text("Email",style: myStyle(18),),
                        hintText: "Email",
                        // hintStyle: TextStyle(color: Colors.purple)
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                    Gap(30),
                    // First TextFormField for Password
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: myStyle(18),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordObs = !isPasswordObs;
                              });
                            },
                            icon: Icon(
                              isPasswordObs ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: isPasswordObs,
                      ),

                      Gap(30),

// Second TextFormField for Re-enter Password
                      TextFormField(
                        controller: _repasswordController,
                        decoration: InputDecoration(
                          labelText: "Re-enter your password",
                          labelStyle: myStyle(18),
                          hintText: "Re-enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isRePasswordObs = !isRePasswordObs;
                              });
                            },
                            icon: Icon(
                              isRePasswordObs ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: isRePasswordObs,
                      ),
                    Gap(10),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width*0.9,
                      color: Colors.deepOrange,
                      onPressed: () async {
                        User? user = await _auth.signUpWithEmailAndPassword(
                            _emailController.text, _passwordController.text);
                        if (user != null) {
                          Get.snackbar("Success", "Registration Successful");
                          Get.offAllNamed('/home');
                        } else {
                          Get.snackbar(
                            "Sorry",
                            "There has been a problem, try again",
                          );
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed('/signin');
                      },
                      child: Text("Already have an account? Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
