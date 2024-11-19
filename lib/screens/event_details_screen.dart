import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              event.location,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${DateFormat.yMMMd().format(event.date)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              event.description.isNotEmpty ? event.description : 'No description available',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement Participate logic here
                    print("Participate button tapped");
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Participate"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement Invite Participants logic here
                    print("Invite Participants button tapped");
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text("Invite Participants"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement Add to Calendar logic here
                    // ignore: avoid_print
                    print("Add to Calendar button tapped");
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("Add to Calendar"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            // Optional: Souvenirs or participants section
            const Text(
              'Event Souvenirs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Here you could add a list of souvenirs or participants
          ],
        ),
      ),
    );
  }
}
