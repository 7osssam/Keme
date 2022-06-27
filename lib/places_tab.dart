import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:keme/database/firebase_utils.dart';
import 'package:keme/model/place.dart';
import 'place_widget.dart';

class PlacesTab extends StatelessWidget {
  final Stream<QuerySnapshot> places =
      FirebaseFirestore.instance.collection('places').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Keme",
        style: Theme.of(context).textTheme.subtitle1,
      )),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Places",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Container(
                height: 300,
                padding: EdgeInsets.all(20),
                child: StreamBuilder<QuerySnapshot>(
                  stream: places,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Something went wrong',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        'Loading',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      );
                    }
                    final data = snapshot.requireData;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          'the place name is ${data.docs[index]['name']} and this location is in ${data.docs[index]['location']} and the location details is ${data.docs[index]['description']}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        );
                      },
                      itemCount: data.size,
                    );
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          const number = '0225315454'; //set the number here
          bool? res = await FlutterPhoneDirectCaller.callNumber(number);
        },
        backgroundColor: Colors.orangeAccent,
        label: const Text('Tourist Police'),
        icon: const Icon(Icons.call),
      ),
    );
  }
}
