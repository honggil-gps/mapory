// App-wide structure and routing configuration

import 'package:flutter/material.dart';
import 'screens/map_screen.dart';

class MaporyApp extends StatelessWidget {
  const MaporyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapory',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 추후 오리 테마로 교체
      ),
      home: const MapScreen(),
    );
  }
}
