class Trip {
  final String title;
  final List<String> photos;
  final String description;
  final DateTime date;
  final String location;
  Trip({
    required this.date,
    required this.title,
    required this.location,
    required this.photos,
    required this.description,
  });
}
