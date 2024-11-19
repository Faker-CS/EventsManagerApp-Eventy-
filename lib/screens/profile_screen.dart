import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    // Update profile logic here
    print("Updating profile: ${_nameController.text}, ${_emailController.text}");
  }

  void _changePassword() {
    // Change password logic here
    print("Change Password tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Update Profile'),
            ),
            TextButton(
              onPressed: _changePassword,
              child: const Text('Change Password'),
            ),
            if (widget.user.estAdmin) ...[
              const Divider(),
              const Text(
                'Admin Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement event management navigation here
                  print("Event Management tapped");
                },
                child: const Text('Manage Events'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement user management navigation here
                  print("User Management tapped");
                },
                child: const Text('Manage Users'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
