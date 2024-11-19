class Event {
  final int id;
  final String title;
  final String location;
  final DateTime date;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    this.description = '',
  });
}
