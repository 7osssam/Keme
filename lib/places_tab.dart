import 'package:flutter/material.dart';
import 'place_widget.dart';

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                PlaceWidget("Must Museum", "Museum",
                    "assets/images/Must Museum.jpg",""),
              ],
            ),
            Row(
              children: [
                PlaceWidget("Pyramids", "Landmark", "assets/images/Pyramids.jpg","assets/images/Pyramids 360.jpg"),
              ],
            ),
            Row(
              children: [
                PlaceWidget("Abu Simbel", "Temple",
                    "assets/images/Abu Simble.jpg",""),
              ],
            ),
            Row(
              children: [
                PlaceWidget("Karnak Temple", "Temple",
                    "assets/images/Karnak Temple.jpg",""),
              ],
            ),
            Row(
              children: [
                PlaceWidget("Hatshepsut Temple", "Temple",
                    "assets/images/Hatshepsut Temple.jpg",""),
              ],
            ),
            Row(
              children: [
                PlaceWidget("The Baron Palace", "Palace",
                    "assets/images/The Baron Palace.jpg",""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
