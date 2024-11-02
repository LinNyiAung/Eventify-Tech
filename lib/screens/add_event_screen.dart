import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/event_model.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _participantsController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  void saveEvent() {
    final event = Event(
      id: '',
      name: _nameController.text,
      date: _dateController.text,
      venue: _venueController.text,
      participants: _participantsController.text.split(','),
    );
    _firestoreService.addEvent(event);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add New Event',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the event name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the date';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _venueController,
              decoration: InputDecoration(
                labelText: 'Venue',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the venue';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _participantsController,
              decoration: InputDecoration(
                labelText: 'Participants (comma-separated)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the participants';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                    onPressed: saveEvent,
                    child: Text('Save Event', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              
                            ),
                  ),
                  
          ],
        ),
      ),
    );
  }
}

