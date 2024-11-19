import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _email;
  String? _password;
  bool _isLoading = false;

  // Getters
  String? get email => _email;
  String? get password => _password;
  bool get isLoading => _isLoading;

  // Setters with NotifyListeners
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Firebase Login Logic
  Future<void> login(BuildContext context) async {
    if (_email == null || _password == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide email and password")),
      );
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: _email!, password: _password!);

      _isLoading = false;
      notifyListeners();

      // Navigate to Home on Success
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
