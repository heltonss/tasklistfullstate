class Pet {
  String title;
  String description;
  String? imageUrl;

  Pet({
    required this.title,
    required this.description,
    this.imageUrl,
  });
}
