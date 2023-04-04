import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> requestPermission() async {
    await [
      Permission.location,
      Permission.contacts,
      Permission.camera,
      Permission.bluetooth,
      Permission.notification,
    ].request();
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "flutter permission handler",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.yellow.shade100,
        actions: [
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.yellow.shade100,
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Text(
            "HomePage",
            style: TextStyle(color: Colors.amber, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
