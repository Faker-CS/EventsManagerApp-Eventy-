import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_view_model.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: viewModel.setName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: viewModel.setEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: viewModel.setPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Select Interests', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 8.0,
                children: viewModel.interests.isEmpty
                    ? ['Music', 'Sports', 'Art', 'Technology'].map((interest) {
                        return ChoiceChip(
                          label: Text(interest),
                          selected: viewModel.interests.contains(interest),
                          onSelected: (_) => viewModel.toggleInterest(interest),
                        );
                      }).toList()
                    : [],
              ),
              SizedBox(height: 20),
              if (viewModel.isLoading)
                Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      viewModel.register(context);
                    }
                  },
                  child: Text('Register'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
