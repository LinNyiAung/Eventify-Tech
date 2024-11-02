import 'package:eventify_tech/screens/edit_event_screen.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../services/firestore_service.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  final FirestoreService _firestoreService = FirestoreService();

  EventDetailsScreen({required this.event});

  void deleteEvent(BuildContext context) {
    _firestoreService.deleteEvent(event.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${event.date}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Venue: ${event.venue}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Participants: ${event.participants.join(', ')}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEventScreen(event: event),
                ),
              ),
              child: Text('Edit Event', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              
                            ),
            ),
            ElevatedButton(
              onPressed: () => deleteEvent(context),
              
              child: Text('Delete Event', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
