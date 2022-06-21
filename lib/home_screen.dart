import 'package:flutter/material.dart';
import 'package:keme/places_tab.dart';
import 'package:keme/setting_tab.dart';
import 'package:navigation_action_bar/navigation_action_bar.dart';
import 'map_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: NavigationActionBar(
        backgroundColor: Color.fromRGBO(34, 33, 38, 1),
        context: context,
        scaffoldColor: Color.fromRGBO(34, 33, 38, 1),
        index: 0,
        subItems: [
          NavBarItem(iconData: Icons.home_max, size: 25),
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
  }


  var tabs = [
    PlacesTab(),
    MapTab(),
    SettingTab(),
  ];
}
