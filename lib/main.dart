import 'package:eventy_frontend/viewmodels/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/registration_screen.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/login_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()), // Register HomeViewModel
        ChangeNotifierProvider(create: (_) => LoginViewModel()), // Register LoginViewModel
        ChangeNotifierProvider(create: (_) => RegisterViewModel()), // Register RegisterViewModel
        // Add more ViewModels here as needed
      ],
      child: MaterialApp(
        title: 'Eventy App',
        initialRoute: '/home', // Starting route
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegistrationScreen(),
          '/home': (context) => HomeScreen(),
          '/profile': (context) => ProfileScreen(
                user: User(id: 1, name: "name", email: "email", estAdmin: true),
              ),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
