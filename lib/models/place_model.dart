import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: "كوبري مبارك",
      latLng: LatLng(30.55008642308178, 31.01053699783192)),
  PlaceModel(
      id: 2,
      name: "محطه قطار شبين الكوم ",
      latLng: LatLng(30.55357515495438, 31.004695444330025)),
  PlaceModel(
      id: 3,
      name: "مشويات الملك فاروق",
      latLng: LatLng(30.555404402464035, 31.018669653749456)),
];
