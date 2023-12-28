import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class premierMap extends StatefulWidget {
  const premierMap({super.key});

  @override
  State<premierMap> createState() => _premierMapState();
}

class _premierMapState extends State<premierMap> {
  double? lating = 0;
  double? longing = 0;
  Completer<GoogleMapController> _controller = Completer();
  // final CameraPosition position = CameraPosition(
  //   target: LatLng(lating!, longing!), //
  //   zoom: 19,
  // );
  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=$google_api&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }
  final String google_api = "AIzaSyAjIubbq1YsSkX6EO4VCW6_soz5MJI6BYY";
  
  @override
  Widget build(BuildContext context) {
    Map<String , String?> detail = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    lating = double.tryParse(detail["team_lat"].toString());
    longing = double.tryParse(detail["team_long"].toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          markers: <Marker>[
            Marker(
                markerId: MarkerId('marker1'),
                position: LatLng(lating!, longing!),
                infoWindow:
                    InfoWindow(title: 'I am work at here', snippet: 'Hide out'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRose),
                ),
          ].toSet(),
          initialCameraPosition: CameraPosition(
    target: LatLng(lating!, longing!), //
    zoom: 19,
  ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}