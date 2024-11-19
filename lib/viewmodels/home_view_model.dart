import 'package:flutter/material.dart';
import '../models/event.dart';

class HomeViewModel with ChangeNotifier {
  // Sample event data
  List<Event> _events = [
    Event(id: 1, title: 'Music Concert', location: 'New York', date: DateTime(2024, 11, 15)),
    Event(id: 2, title: 'Art Exhibition', location: 'Paris', date: DateTime(2024, 12, 5)),
    Event(id: 3, title: 'Tech Conference', location: 'San Francisco', date: DateTime(2025, 1, 20)),
    Event(id: 4, title: '3eress Bendir-Man', location: 'Khzema', date: DateTime(2025, 5, 22)),
  ];

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners(); // Notify the view to rebuild
  }

  void removeEvent(int id) {
    _events.removeWhere((event) => event.id == id);
    notifyListeners(); // Notify the view to rebuild
  }
}
