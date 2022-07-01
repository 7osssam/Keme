import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keme/home_screen.dart';
import 'package:keme/reset_password.dart';
import 'package:keme/reusable_widgets/reusable_widget.dart';
import 'package:keme/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'Sign_in_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String message = '';
  bool obsecureText=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212126),
      appBar: AppBar(
        title: Text("Keme",style: TextStyle(fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
          SizedBox(height: 30,),
          TextField(
            controller: _emailTextController,
            enableSuggestions: obsecureText,
            autocorrect: obsecureText,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.white70,
              ),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
              filled: true,
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
            ),
          ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordTextController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
                obscureText: obsecureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.white70,
                  ),
                  suffixIcon:GestureDetector(
                    onTap: (){
                      setState(() {
                        obsecureText=!obsecureText;
                      }) ;
                    },
                    child: Icon(obsecureText? Icons.visibility: Icons.visibility_off,color: Colors.white70,),

                  ) ,
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
                  filled: true,
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              forgetPassword(context),
              firebaseUIButton(context, "Sign In", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  message = error.toString();
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Row(
                              children: [Expanded(child: Text(message))],
                            ),
                          ));
                  print("Error ${message}");
                });
              }),
              signUpOption()
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
