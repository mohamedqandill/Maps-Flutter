import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/models/place_model.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 11, target: LatLng(30.45049151278841, 31.019930027036622));
    initMarkers();
    initMapStyle();
    initPolyLines();
    initPolyGons();
    initCircles();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();

    super.dispose();
  }

  var nightString;

  initMapStyle() async {
    nightString = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/night_map_style.json");
  }

  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          circles:circles ,

            polylines: polyLines,
            polygons: polygons,
            zoomControlsEnabled: false,
            markers: markers,
            style: nightString.toString(),
            onMapCreated: (controller) {
              googleMapController = controller;
            },
            // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            //     southwest: const LatLng(30.179012817673172, 30.834666289355418),
            //     northeast: const LatLng(31.08062288997153, 31.71906571013122))),
            initialCameraPosition: initialCameraPosition),
        // Positioned(
        //   bottom: 16,
        //   left: 16,
        //   right: 16,
        //   child: ElevatedButton(
        //       onPressed: () {
        //         googleMapController.animateCamera(CameraUpdate.newLatLng(
        //             LatLng(31.153755253114504, 29.88854897365635)));
        //       },
        //       child: const Text("Change Location")),
        // )
      ],
    );
  }

  void initMarkers() async {
    var customIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(), "assets/images/night_map.png",
        width: 50, height: 50);
    var myMarkers = places
        .map(
          (placeModel) => Marker(
              icon: customIcon,
              infoWindow: InfoWindow(title: placeModel.name),
              position: placeModel.latLng,
              markerId: MarkerId(placeModel.id.toString())),
        )
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }

  void initPolyLines() {

    Polyline polyline = const Polyline(

        polylineId: PolylineId("1"), points: [
      LatLng(30.557939159899817, 31.01921587691377),
      LatLng(30.55540440251057, 31.01572611776485),
      LatLng(30.557390403605716, 31.010263886053504),
    ]);
    polyLines.add(polyline);
  }

  void initPolyGons() {
    Polygon polygon = const Polygon(
        holes: [
          [
            LatLng(30.544805665393156, 31.013713715727416),
            LatLng(30.544401629910716, 31.010393678599794),
            LatLng(30.54216386448971, 31.012234133964025),
          ]
        ],
        polygonId: PolygonId("1"), points: [
      LatLng(30.54671653781597, 31.01366130703648),
      LatLng(30.546101203531897, 31.007945360821815),
      LatLng(30.539117934245677, 31.012631094924934),
    ]);
    polygons.add(polygon);
  }

  void initCircles() {
    Circle circle= Circle(

      fillColor: Colors.black.withOpacity(0.5),
      radius: 10000,
        center: LatLng(30.566235679941784, 31.00724824496807),
        circleId: CircleId("1"));
    circles.add(circle);
  }
}

// world view  0->3
// country view 4->6
// city view 10->12
//street view 13->17
//building view 18->20
