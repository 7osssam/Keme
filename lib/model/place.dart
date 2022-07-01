class Place {
  String location;
  String name;
  String description;
  String image;

  Place(
      {required this.location,
      required this.name,
      required this.description,
      required this.image});

  Place.fromJson(Map<String, dynamic?> json)
      : this(
          location: json['location'] as String,
          name: json['name'] as String,
          description: json['description'] as String,
          image: json['image'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'name': name,
      'description': description,
      'image': image
    };
  }
}
