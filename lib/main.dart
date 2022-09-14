import 'package:flutter/material.dart';
import 'package:ninja_id/pages/choose_location.dart';
import 'package:ninja_id/pages/home.dart';
import 'package:ninja_id/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(), // Loading the information needed for the app.
      '/home': (context) => Home(), // Showing the date and time for the selected location.
      '/location': (context) => ChooseLocation(), // Changing the selected location.
    },
  )
  );
}