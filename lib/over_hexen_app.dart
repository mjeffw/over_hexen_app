import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/home.dart';

class OverHexenApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Over Hexen',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
