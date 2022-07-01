import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keme/model/place.dart';

CollectionReference<Place> getPlacesCollection(){
  var typedCollection = FirebaseFirestore.instance
      .collection('Places')
      .withConverter<Place>(
      fromFirestore:(snapshot, options) => Place.fromJson(snapshot.data()!) ,
      toFirestore: (task,options)=>task.toJson());
  return typedCollection;
}

Future<QuerySnapshot<Place>> getPlaces(){
  return getPlacesCollection()
      .get();
}
Stream<QuerySnapshot<Place>> listenForPlaces(){
  return getPlacesCollection()
      .snapshots();
}