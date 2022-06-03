import 'package:flutter/material.dart';
import 'package:keme/places_tab.dart';
import 'package:keme/setting_tab.dart';
import 'camera_tab.dart';
import 'map_tab.dart';
//import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.place, color: Colors.orangeAccent,),
              label: "Places"),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined, color: Colors.orangeAccent),
              label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: Colors.orangeAccent),
              label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.orangeAccent),
              label: "Setting"),
        ],
      ),
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //         bottomBarItems: [
      //           BottomBarItemsModel(
      //               icon: const Icon(Icons.home, size: example.Dimens.iconNormal),
      //               iconSelected: const Icon(Icons.home, color: AppColors.cherryRed, size: example.Dimens.iconNormal),
      //               title: example.Strings.home,
      //               dotColor: example.AppColors.cherryRed,
      //               onTap: () =>log('Home'),
      //           ),
      //           const BottomBarItemsModel(
      //             icon: Icon(Icons.search, size: example.Dimens.iconNormal),
      //             iconSelected: Icon(Icons.search, color: AppColors.cherryRed, size: example.Dimens.iconNormal),
      //             title: example.Strings.search,
      //             dotColor: example.AppColors.cherryRed,
      //             onTap: () =>log('Search'),
      //           ),
      //           const BottomBarItemsModel(
      //             icon: Icon(Icons.person, size: example.Dimens.iconNormal),
      //             iconSelected: Icon(Icons.person, color: AppColors.cherryRed, size: example.Dimens.iconNormal),
      //             title: example.Strings.person,
      //             dotColor: example.AppColors.cherryRed,
      //             onTap: () =>log('Person'),
      //           ),
      //           const BottomBarItemsModel(
      //             icon: Icon(Icons.settings, size: example.Dimens.iconNormal),
      //             iconSelected: Icon(Icons.settings, color: AppColors.cherryRed, size: example.Dimens.iconNormal),
      //             title: example.Strings.settings,
      //             dotColor: example.AppColors.cherryRed,
      //             onTap: () =>log('Settings'),
      //           ),
      //         ],
      //         bottomBarCenterModel: BottomBarCenterModel(
      //           centerBackgroundColor: example.AppColors.cherryRed,
      //           centerIcon: const FloatingCenterButton(
      //             child: Icon(
      //               Icons.add,
      //               color: AppColors.white,
      //             ),
      //           ),
      //           centerIconChild: [
      //             FloatingCenterButtonChild(
      //               child: const Icon(
      //                 Icons.home,
      //                 color: AppColors.white,
      //               ),
      //               onTap: () {},
      //             ),
      //             FloatingCenterButtonChild(
      //               child: const Icon(
      //                 Icons.home,
      //                 color: AppColors.white,
      //               ),
      //               onTap: () {},
      //             ),
      //             FloatingCenterButtonChild(
      //               child: const Icon(
      //                 Icons.home,
      //                 color: AppColors.white,
      //               ),
      //               onTap: () {},
      //             ),
      //           ],
      //         ),
      //       ),

    );
  }

  var tabs = [
    PlacesTab(),
    MapTab(),
    CameraTab(),
    SettingTab(),
  ];
}

