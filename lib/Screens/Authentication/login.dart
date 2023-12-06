import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notesapp_firebase/core/functions/ShowPopoutAlert.dart';
import 'package:notesapp_firebase/core/widgets/customButton.dart';
import 'package:notesapp_firebase/core/widgets/customLogo.dart';
import 'package:notesapp_firebase/core/widgets/textFormField.dart';
// import 'dart:html';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomLogo(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 15),
                  child: Text(
                    "Login to continue using the app",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter an email",
                  myController: emailController,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter a password",
                  myController: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Forget password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: CustomButton(
                  onPressed: () async {
                    try {
                      // ignore: unused_local_variable
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                      Navigator.popAndPushNamed(context, "Home");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showPopupAlert(
                            context, "ERROR", "No user found for that email");
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showPopupAlert(context, "wrong-password",
                            "Wrong password provided for that user.");
                        print('Wrong password provided for that user.');
                      } else
                        print(e.code);
                    }
                  },
                  text: "Login",
                  size: screenWidth - 35,
                )),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Or login with",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    IconButton(
                        onPressed: null, icon: Icon(Icons.email_outlined)),
                    IconButton(onPressed: null, icon: Icon(Icons.person_add)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account, Tap to ",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("Signup");
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.lightBlue.shade300, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
