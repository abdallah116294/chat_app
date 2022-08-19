import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frienz/shared/app_routes.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../shared/assetes_manger.dart';
import '../shared/color_manager.dart';
import '../shared/widget/custom_button.dart';
import '../shared/widget/custom_textfomfiled.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordContrller = TextEditingController();


  var formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          title: const Text(
            'Sign Up',
            style: TextStyle(color: AppColor.textColor),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign up tO chat',
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(ImageAssets.logo),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextFormFiled(
                    controller: emailController,
                    onPresed: () {},
                    inputFiled: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty ';
                      }
                    },
                    prefixIcon: Icons.email,
                    onchange: (data) {},
                    textInputType: TextInputType.emailAddress,
                    isObscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormFiled(
                    onPresed: () {},
                    controller: passwordContrller,
                    inputFiled: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty ';
                      }
                    },
                    prefixIcon: Icons.lock,
                    onchange: (data) {},
                    textInputType: TextInputType.emailAddress,
                    isObscureText: false,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () async {
                        isloading = true;
                        setState(() {});
                        if (formKey.currentState!.validate()) {
                          try {
                            await registerUser();
                          } on FirebaseAuthException catch (e) {
                            snackMaessge(context, e);
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                      style: const TextStyle(color: AppColor.secondMessage),
                      width: 200,
                      action: 'Sign Up',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void snackMaessge(BuildContext context, FirebaseAuthException e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordContrller.text);
  }
}
