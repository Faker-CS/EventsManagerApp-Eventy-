import 'package:eventy_frontend/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../screens/profile_screen.dart';
import '../viewmodels/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context); // Access the ViewModel

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    user: User(id: 1, name: "Benzima", email: "benzimakimou@gmil.com"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: viewModel.events.length,
          itemBuilder: (context, index) {
            final event = viewModel.events[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(event.title),
                subtitle: Text('${event.location} - ${DateFormat.yMMMd().format(event.date)}'),
                onTap: () {
                  // Navigate to event details screen (to be implemented)
                  print("Tapped on ${event.title}");
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new event for demonstration
          viewModel.addEvent(
            Event(
              id: viewModel.events.length + 1,
              title: 'New Event',
              location: 'New Location',
              date: DateTime.now(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
