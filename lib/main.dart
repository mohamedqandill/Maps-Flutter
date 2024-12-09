import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/widgets/custom_google_maps.dart';

void main() {
  runApp(const GoogleMapsFlutter());
}


class GoogleMapsFlutter extends StatelessWidget {
  const GoogleMapsFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMaps(),
    );
  }
}


