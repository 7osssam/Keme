import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keme/place_details.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceWidget extends StatelessWidget {
  String Place;
  String Location;
  String ImagePath;

  PlaceWidget(this.Place, this.Location, this.ImagePath);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, PlaceDetails.routeName,
                arguments: PlaceDetailsArgs(placeName: Place),);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(ImagePath,
                      width: MediaQuery.of(context).size.width, height: 200, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: 0,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Text(
                  Location,
                  style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Sen'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Text(
                  Place,
                  style: TextStyle(color: Colors.white, fontSize: 28,fontFamily: 'Gilroy'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
