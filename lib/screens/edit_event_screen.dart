import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../services/firestore_service.dart';

class EditEventScreen extends StatefulWidget {
  final Event event;

  EditEventScreen({required this.event});

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _venueController;
  late TextEditingController _participantsController;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.event.name);
    _dateController = TextEditingController(text: widget.event.date);
    _venueController = TextEditingController(text: widget.event.venue);
    _participantsController = TextEditingController(text: widget.event.participants.join(', '));
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedEvent = Event(
        id: widget.event.id,
        name: _nameController.text,
        date: _dateController.text,
        venue: _venueController.text,
        participants: _participantsController.text.split(',').map((e) => e.trim()).toList(),
      );
      _firestoreService.updateEvent(widget.event.id, updatedEvent);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _venueController.dispose();
    _participantsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              'Edit Event',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Event Name', border: OutlineInputBorder(),), 
                validator: (value) => value == null || value.isEmpty ? 'Enter event name' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date', border: OutlineInputBorder(),),
                validator: (value) => value == null || value.isEmpty ? 'Enter date' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _venueController,
                decoration: InputDecoration(labelText: 'Venue', border: OutlineInputBorder(),),
                validator: (value) => value == null || value.isEmpty ? 'Enter venue' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _participantsController,
                decoration: InputDecoration(labelText: 'Participants (comma-separated)', border: OutlineInputBorder(),),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              
                            ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
