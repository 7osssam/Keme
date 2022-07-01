import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:keme/ar_tour_tab.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:keme/places_tab.dart';
import 'package:keme/qr_tab.dart';
import 'package:keme/report_bugs.dart';
import 'package:keme/signin_screen.dart';
import 'ar_tour_tab.dart';
import 'map_tab.dart';
import 'screens/main_ocr.dart';
import 'qr_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;

  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
  touristPolice() async{
    const number = '0225315454'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Keme",style: Theme.of(context).textTheme.subtitle1,)),
        drawer: Drawer(
          backgroundColor: Color(0xff212126),
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Text('Drawer Header'),
              ),

              ListTile(
                leading:Icon(Icons.report_outlined,color: Colors.white,),
                title: Text('Rebort Bugs',style: TextStyle(color: Colors.white),),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReportBugs()));
                },
              ),
              ListTile(
                leading:Icon(Icons.call,color: Colors.white,),
                title: Text('Tourist Police',style: TextStyle(color: Colors.white),),
                onTap: (){
                  touristPolice();
                },
              ),
              ListTile(
                leading:Icon(Icons.logout,color: Colors.red,),
                title: Text('Logout',style: TextStyle(color: Colors.white),),
                onTap: (){
                  signOut();
                },
              ),
            ],
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.map, size: 30),
            Icon(Icons.qr_code_scanner, size: 30),
            Icon(Icons.find_in_page, size: 30),
            Icon(Icons.place, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.orangeAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            currentIndex = index;
            setState(() {}

            );
          },
          letIndexChange: (index) => true,
        ),

      );

  }

  var tabs = [
    PlacesTab(),
    MapTab(),
    ScanScreen(),
    MainOcr(),
    ArTourTab(),

  ];
}