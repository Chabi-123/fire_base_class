class PlaceModel {
  String id;
  String name;
  String location;
  String imageUrl;
  String description;


  PlaceModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
  });


  // Convert a PlaceModel object into a Map object to send to Cloud
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
      'description': description,
    };
  }


  // Create a PlaceModel object from a Map object for fetching from Cloud\
// Convert the Map object to PlaceModel object
  factory PlaceModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PlaceModel(
      id: documentId,
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
