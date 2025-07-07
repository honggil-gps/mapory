// Main map screen implementation

import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapory Map'),
      ),
      body: const Center(
        child: Text('Map will be here!'),
      ),
    );
  }
}
