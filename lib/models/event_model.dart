class Event {
  final String id;
  final String name;
  final String date;
  final String venue;
  final List<String> participants;

  Event({required this.id, required this.name, required this.date, required this.venue, required this.participants});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'venue': venue,
      'participants': participants,
    };
  }

  factory Event.fromMap(String id, Map<String, dynamic> map) {
    return Event(
      id: id,
      name: map['name'],
      date: map['date'],
      venue: map['venue'],
      participants: List<String>.from(map['participants']),
    );
  }
}
