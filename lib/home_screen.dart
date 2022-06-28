import 'package:flutter/material.dart';
import 'package:keme/ar_tour_tab.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:keme/places_tab.dart';
import 'package:keme/qr_tab.dart';
import 'package:keme/signin_screen.dart';
import 'ar_tour_tab.dart';
import 'map_tab.dart';
import 'screens/main_ocr.dart';
import 'qr_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
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
class NavigationDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) =>Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context)=> Container();

  Widget buildMenuItems(BuildContext context)=> Column(
    children: [
      ListTile(
        leading:Icon(Icons.home_outlined),
        title: Text('Home'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PlacesTab()));
        },
      ),
      ListTile(
        leading:Icon(Icons.map),
        title: Text('Map'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MapTab()));
        },
      ),
      ListTile(
        leading:Icon(Icons.qr_code_scanner),
        title: Text('Scan Qr'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ScanScreen()));
        },
      ),
      ListTile(
        leading:Icon(Icons.find_in_page),
        title: Text('Scan Photo'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainOcr()));
        },
      ),
      ListTile(
        leading:Icon(Icons.place),
        title: Text('Tour'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ArTourTab()));
        },
      ),
      ListTile(
        leading:Icon(Icons.logout,color: Colors.red,),
        title: Text('Logout'),
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignInScreen()));
        },
      ),
    ],
  );
}
