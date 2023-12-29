import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class premierMap extends StatefulWidget {
  const premierMap({super.key});

  @override
  State<premierMap> createState() => _premierMapState();
}

class _premierMapState extends State<premierMap> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  double? lating = 0;
  double? longing = 0;
  Completer<GoogleMapController> _controller = Completer();
  _openGoogleMapApp(double lat, double long) async {
    Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=$google_api&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }

  final String google_api = "AIzaSyAjIubbq1YsSkX6EO4VCW6_soz5MJI6BYY";

  @override
  Widget build(BuildContext context) {
    Map<String, String?> detail =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    lating = double.tryParse(detail["team_lat"].toString());
    longing = double.tryParse(detail["team_long"].toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 165, 48, 233),
        title: const Text('Map Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              _animationController
                  .forward(); // เริ่ม Animation เมื่อปุ่มถูกคลิก
              // เรียกใช้ showGeneralDialog เมื่อปุ่มถูกคลิก
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 300),
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width *
                                0.9, // กำหนดความกว้าง Popup
                            height: MediaQuery.of(context).size.height *
                                0.9, // กำหนดความสูง Popup
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8), // กำหนดความโปร่งใส
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Team Information:',
                                      style: TextStyle(fontSize: 20)),
                                  SizedBox(height: 10),
                                  Text(
                                    '${detail["team_detail"]}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  // ... เพิ่มข้อมูลเพิ่มเติมตามต้องการ
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
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
