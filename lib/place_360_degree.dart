import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class Place360Degree extends StatelessWidget {
  static String routeName = 'place_360_degree';
String image360degree;
  Place360Degree(this.image360degree);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Panorama(
          child: Image.asset(image360degree)
      ),

    );
  }
}
