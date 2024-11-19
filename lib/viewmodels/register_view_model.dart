import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _email;
  String? _password;
  String? _name;
  List<String> _interests = [];
  bool _isLoading = false;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  List<String> get interests => _interests;
  bool get isLoading => _isLoading;

  // Setters
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void toggleInterest(String interest) {
    if (_interests.contains(interest)) {
      _interests.remove(interest);
    } else {
      _interests.add(interest);
    }
    notifyListeners();
  }

  //Registration Login
  Future<void> register(BuildContext context) async {
    if (_email == null || _password == null || _name == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields !")),
      );
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(email: _email!, password: _password!);

      _isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful! Please login.")));

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
