class Place {
  String id;
  String name;
  String description;

  Place({required this.id, required this.name, required this.description});

  Place.fromJson(Map<String, dynamic?> json)
      : this(
            id: json['id'] as String,
            name: json['name'] as String,
            description: json['description'] as String);

  Map<String, dynamic>   toJson() {
    return {'id': id, 'name': name, 'description': description};
  }
}
