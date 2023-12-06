import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase/core/functions/ShowPopoutAlert.dart';

import '../../core/widgets/customButton.dart';
import '../../core/widgets/customLogo.dart';
import '../../core/widgets/textFormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomLogo(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Text(
                    "Signup",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 15),
                  child: Text(
                    "Fill the fields",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Username",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter a username",
                  myController: usernameController,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter an email",
                  myController: emailcontroller,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter a password",
                  myController: passwordcontroller,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Text(
                    "Confirm password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextFormField(
                  value: "Enter the password again",
                  myController: passwordcontroller,
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: CustomButton(
                  onPressed: () async {
                    try {
                      // ignore: unused_local_variable
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                      );
                      Navigator.popAndPushNamed(context, "Home");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showPopupAlert(
                            context, "Weak Passowrd", "Choose another");
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        showPopupAlert(context, e.code,
                            "The account already exists for that email.");
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: "Signup",
                  size: screenWidth - 35,
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account, ",
                        style: TextStyle(fontSize: 12),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed("Login");
                        },
                        child: Text(
                          "login",
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
