import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTab extends StatefulWidget {
  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  @override
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition misrUniversty = CameraPosition(
    target: LatLng(29.9975, 30.9660),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};
  double defLat = 29.9975;
  double defLng = 30.9660;

  @override
  void initState() {
    super.initState();
    intilize();
    getUserLocation();
    var userMarker = Marker(
      markerId: const MarkerId('user_location'),
      position: LatLng(
          locationData?.latitude ?? defLat, locationData?.longitude ?? defLng),
    );
    markers.add(userMarker);
  }

  intilize() {
    Marker mustMusuem = Marker(
      markerId: MarkerId('Must Museum'),
      position: LatLng(29.9938, 30.9650),
      infoWindow: InfoWindow(title: 'Must Museum'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker pyramids = Marker(
      markerId: MarkerId('pyramids'),
      position: LatLng(29.9792, 31.1342),
      infoWindow: InfoWindow(title: 'pyramids'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker abuSimbel = Marker(
      markerId: MarkerId('Abu Simbel'),
      position: LatLng(22.3372, 31.6258),
      infoWindow: InfoWindow(title: 'Abu Simbel'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker karnakTemple = Marker(
      markerId: MarkerId('Karnak Temple'),
      position: LatLng(25.7041, 32.6434),
      infoWindow: InfoWindow(title: 'Karnak Temple'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker hatshepsutTemple = Marker(
      markerId: MarkerId('Hatshepsut Temple'),
      position: LatLng(25.7383, 32.6065),
      infoWindow: InfoWindow(title: 'Hatshepsut Temple'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker baronPalace = Marker(
      markerId: MarkerId('Baron Palace'),
      position: LatLng(30.0867, 31.3303),
      infoWindow: InfoWindow(title: 'Baron Palace'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    setState(() {
      markers.add(mustMusuem);
      markers.add(pyramids);
      markers.add(abuSimbel);
      markers.add(karnakTemple);
      markers.add(hatshepsutTemple);
      markers.add(baronPalace);
    });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: misrUniversty,
        onMapCreated: (controller) async {
          String style = await DefaultAssetBundle.of(context)
              .loadString('assets/map_style.json');
          controller.setMapStyle(style);
          _controller.complete(controller);
        },
        markers: markers,
      ),
    );
  }

  Location location = Location();
  LocationData? locationData;

  @override
  void dispose() {
    super.dispose();
  }

  void getUserLocation() async {
    bool permGranted = await isPermissionGranted();
    if (!permGranted) return;
    bool gpsEnabled = await isServiceEnabled();
    if (!gpsEnabled) return;
    locationData = await location.getLocation(); //can get location
    location.changeSettings(
        accuracy: LocationAccuracy.high, interval: 1000, distanceFilter: 1);
    location.onLocationChanged.listen((newestLocation) {
      locationData = newestLocation;
      updateUserMarker();
    });
  }

  void updateUserMarker() async {
    var userMarker = Marker(
      markerId: const MarkerId('user_location'),
      position: LatLng(
          locationData?.latitude ?? defLat, locationData?.longitude ?? defLng),
    );
    markers.add(userMarker);
    setState(() {});
    final GoogleMapController controller = await _controller.future;
    var newCameraPosition = CameraPosition(
        target: LatLng(locationData?.latitude ?? defLat,
            locationData?.longitude ?? defLng),
        zoom: 19);
    controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<bool> isPermissionGranted() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> isServiceEnabled() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }
}
