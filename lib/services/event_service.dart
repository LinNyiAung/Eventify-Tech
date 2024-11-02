import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createEvent(String eventName, DateTime date, String venue) async {
    await _db.collection('events').add({
      'eventName': eventName,
      'date': date.toIso8601String(),
      'venue': venue,
    });
  }

  Stream<QuerySnapshot> getUpcomingEvents() {
    return _db.collection('events').where('date', isGreaterThan: DateTime.now().toIso8601String()).snapshots();
  }

  Future<void> updateEvent(String eventId, Map<String, dynamic> eventData) async {
    await _db.collection('events').doc(eventId).update(eventData);
  }

  Future<void> deleteEvent(String eventId) async {
    await _db.collection('events').doc(eventId).delete();
  }
}
