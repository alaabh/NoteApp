class Note {
  final String id;
  final String title;
  final String short_desciption;
  final String description;
  final String image;
  final String date_creation;

  Note({
    required this.id,
    required this.title,
    required this.short_desciption,
    required this.description,
    required this.image,
    required this.date_creation,
  });

  factory Note.fromMap(Map<String, dynamic> data) {
    return Note(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      short_desciption: data['short_desciption'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      date_creation: data['date_creation'] ?? '',
    );
  }
}