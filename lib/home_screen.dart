import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:keme/places_tab.dart';
import 'ar_tour_tab.dart';
import 'package:keme/setting_tab.dart';
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
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: tabs[currentIndex], 
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
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
=======
      body: tabs[currentIndex],
      bottomNavigationBar: NavigationActionBar(
        backgroundColor: Color.fromRGBO(34, 33, 38, 1),
        context: context,
        scaffoldColor: Color.fromRGBO(34, 33, 38, 1),
        index: 0,
        subItems: [
          NavBarItem(iconData: Icons.home_max, size: 25),
          NavBarItem(
            iconData: Icons.home,
            size: 25,
          ),
          NavBarItem(iconData: Icons.search, size: 25),
          NavBarItem(iconData: Icons.camera_alt, size: 25),
        ],
        mainIndex: 1,
        items: [
          NavBarItem(iconData: Icons.place_sharp, size: 30),
          NavBarItem(iconData: Icons.add, size: 60),
          NavBarItem(iconData: Icons.settings, size: 30),
        ],

        onTap: (index) {
          setState(() {
           currentIndex = index.toInt();
          });
        },
      
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     currentIndex = index;
      //     setState(() {});
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.place, color: Colors.orangeAccent,),
      //         label: "Places"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.map_outlined, color: Colors.orangeAccent),
      //         label: "Map"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.camera, color: Colors.orangeAccent),
      //         label: "Camera"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings, color: Colors.orangeAccent),
      //         label: "Setting"),
      //   ],
      // ),

    );
>>>>>>> ee61022648b5c1ec2525fd8f8895ec7d11c61b22
  }


  var tabs = [
    PlacesTab(),
    MapTab(),
<<<<<<< HEAD
    MainOcr(),
    ArTourTab(),
    ScanScreen(),
=======
    SettingTab(),
>>>>>>> ee61022648b5c1ec2525fd8f8895ec7d11c61b22
  ];
}
