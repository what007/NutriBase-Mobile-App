class Todo {
  String uid;
  String title;
  bool isComplet;
  String? details; // Added details field
  String? createdDate; // Added createdDate field

  Todo({
    required this.uid,
    required this.title,
    required this.isComplet,
    this.details,
    this.createdDate,
  });
}
