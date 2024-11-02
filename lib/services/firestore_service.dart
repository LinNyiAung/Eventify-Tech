import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class FirestoreService {
  final CollectionReference _eventsCollection = FirebaseFirestore.instance.collection('events');

  Future<void> addEvent(Event event) async {
    await _eventsCollection.add(event.toMap());
  }

  Future<void> updateEvent(String id, Event event) async {
    await _eventsCollection.doc(id).update(event.toMap());
  }

  Future<void> deleteEvent(String id) async {
    await _eventsCollection.doc(id).delete();
  }

  Stream<List<Event>> getUpcomingEvents() {
    return _eventsCollection.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => Event.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList(),
    );
  }
}
