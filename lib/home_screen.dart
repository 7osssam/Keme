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
  }


  var tabs = [
    PlacesTab(),
    MapTab(),
    MainOcr(),
    ArTourTab(),
    ScanScreen(),
  ];
}
