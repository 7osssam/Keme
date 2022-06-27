import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keme/qr_tab.dart';
import 'package:keme/my_theme.dart';
import 'package:keme/place_360_degree.dart';
import 'package:keme/place_details.dart';
import 'package:keme/reset_password.dart';
import 'package:keme/setting_tab.dart';
import 'package:keme/signin_screen.dart';
import 'package:keme/signup_screen.dart';
import 'ar_tour_tab.dart';
import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomeScreen()
          : SignInScreen(),
      title: "Keme",
      routes: {
        SignInScreen.routeName:(buildContext)=>SignInScreen(),
        SignUpScreen.routeName:(buildContext)=>SignUpScreen(),
        ResetPassword.routeName:(buildContext)=>ResetPassword(),
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        PlaceDetails.routeName: (buildContext) => PlaceDetails(),
        //QRViewExample.routeName: (buildContext) => FilterTab(),
        ArTourTab.routeName: (buildContext) => ArTourTab(),
        Place360Degree.routeName: (buildContext) => Place360Degree(),
        SettingTab.routeName: (buildContext) => SettingTab(),
      },
     // initialRoute: SignInScreen  .routeName,
      theme: MyThemeData.DarkTheme,
    );
  }
}
//hi hos

//create an app bar 
//create a bottom navigation bar
//create a tab bar

AppBar createAppBar(BuildContext context) {
  return AppBar(
    title: Text("Keme"),
    centerTitle: true,
    backgroundColor: MyThemeData.DarkTheme.scaffoldBackgroundColor,
    elevation: 0,
  );
}   
