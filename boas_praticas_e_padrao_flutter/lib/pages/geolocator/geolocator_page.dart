// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPage extends StatefulWidget {
  const GeolocatorPage({super.key});

  @override
  State<GeolocatorPage> createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  Position? posicao;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      timeLimit: const Duration(seconds: 6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Localizador")),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  Position novaPosicao = await _determinePosition();
                  setState(() {
                    posicao = novaPosicao;
                  });
                  debugPrint(novaPosicao.toString());
                },
                child: Text("Obter Localização"),
              ),
              Text(
                posicao == null
                    ? "Localização não obtida"
                    : "Latitude: ${posicao!.latitude}\nLongitude: ${posicao!.longitude}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
