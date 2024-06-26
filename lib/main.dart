// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:gas/login/login.dart';
import 'package:gas/login/register.dart';
import 'package:provider/provider.dart'; // Import the provider package
// Adjust the import based on your project structure
import 'package:gas/services/auth_service.dart'; // Import your AuthService

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyChangeNotifier(), // Replace with your actual service
      child: MaterialApp(
          title: 'Gas',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginSixPage(),
          routes: {
            'registerSixPage': (context) => RegisterSixPage(),
            'loginSixPage': (context) => LoginSixPage(),
          }),
    );
  }
}

class MyChangeNotifier extends ChangeNotifier {
  // Add your notifier logic here
}
