import 'package:flutter/material.dart';

import 'dsi_page.dart';
import 'home_page.dart';

class DSIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add to App',
      theme: ThemeData(
        primaryColor: Colors.grey[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'Home',
      routes: {
        'Home': (context) => HomePage(),
        'DSI': (context) => DSIPage(),
      },
    );
  }
}
