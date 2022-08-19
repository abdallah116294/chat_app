import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frienz/screens/chat_screen.dart';
import 'package:frienz/shared/assetes_manger.dart';
import 'package:frienz/shared/color_manager.dart';
import 'package:frienz/shared/widget/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../shared/app_routes.dart';
import '../shared/widget/custom_textfomfiled.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void snackMaessge(BuildContext context, String mes,
      {FirebaseAuthException? e}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(' $mes')));
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emal!, password: paswword!);
  }

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  String? emal, paswword;

  var formkey = GlobalKey<FormState>();

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
            'Login',
            style: TextStyle(color: AppColor.textColor),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to chat',
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
                    onPresed: () {},
                    controller: emailController,
                    inputFiled: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty ';
                      }
                    },
                    prefixIcon: Icons.email,
                    onchange: (data) {
                      emal = data;
                    },
                    textInputType: TextInputType.emailAddress,
                    isObscureText: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormFiled(
                    onPresed: () {},
                    controller: passwordController,
                    inputFiled: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty ';
                      }
                    },
                    prefixIcon: Icons.email,
                    onchange: (data) {
                      paswword = data;
                    },
                    textInputType: TextInputType.emailAddress,
                    isObscureText: false,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            // ignore: use_build_context_synchronously
                            // Navigator.pushNamed(context, Routes.chatScreen,
                            //     arguments:emal);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChatScreen(email: emal,);
                            }));
                            snackMaessge(context, 'succed');
                          } on FirebaseAuthException catch (e) {
                            snackMaessge(context, e: e, e.toString());
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                      style: const TextStyle(color: AppColor.secondMessage),
                      width: 200,
                      action: 'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do\'t have an account ?',
                        style: TextStyle(color: AppColor.textColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        child: const Text(
                          'sign up ',
                          style: TextStyle(
                              color: AppColor.textColor, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
