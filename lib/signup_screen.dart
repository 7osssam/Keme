import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keme/home_screen.dart';
import 'package:keme/reusable_widgets/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'Sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  String message = '';
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xff212126)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _userNameTextController,
                  enableSuggestions: obsecureText,
                  autocorrect: obsecureText,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "UserName",
                    labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 16),
                    filled: true,
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailTextController,
                  enableSuggestions: obsecureText,
                  autocorrect: obsecureText,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 16),
                    filled: true,
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordTextController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 16),
                  obscureText: obsecureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white70,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                      child: Icon(
                        obsecureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 16),
                    filled: true,
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    message = error.toString();
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Row(
                                children: [Expanded(child: Text(message))],
                              ),
                            ));
                    print(message);
                  });
                })
              ],
            ),
          ))),
    );
  }
}
