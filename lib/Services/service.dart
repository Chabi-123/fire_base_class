import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_class/Model/model_class.dart';


class PlacesServices {
  Future<void> addPlace(PlaceModel place) async {
    final docRef = FirebaseFirestore.instance.collection('places').doc();
    place.id = docRef.id;
    await docRef.set(place.toMap());
  }


  Stream<List<PlaceModel>> fetchPlaces() {
    return FirebaseFirestore.instance.collection('places').snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => PlaceModel.fromMap(doc.data(), doc.id))
            .toList());
  }


  Future<void> updatePlace(PlaceModel place) async {
    final docRef =
    FirebaseFirestore.instance.collection('places').doc(place.id);
    await docRef.update(place.toMap());
  }


  Future<void> deletePlace(String placeId) async {
    final docRef = FirebaseFirestore.instance.collection('places').doc(placeId);
    await docRef.delete();
  }
}
