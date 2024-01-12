import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  void getCurrentposition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission Not Given");
      LocationPermission askPermission = await Geolocator.requestPermission();
    } else {
      Position currentPostion = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print(currentPostion.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print("Hello");
              },
              icon: const Icon(
                Icons.refresh,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main Card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(children: [
                        Text(
                          "300 F",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Icon(
                          Icons.cloud,
                          size: 68,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Rain",
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // whether forcast card
            const Text(
              "Whether Forecast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const SingleChildScrollView(
              // ---->
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlForecastItem(
                      icon: Icons.cloud, time: '03:00', temp: "300"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // additional info
            const Text(
              "Additional Info..",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                    icon: Icons.water_drop, label: 'Humidity', value: '69'),
                AdditionalInfoItem(
                    icon: Icons.air, label: 'Wind Speed', value: '88'),
                AdditionalInfoItem(
                    icon: Icons.beach_access, label: 'Pressure', value: '45'),
              ],
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      getCurrentposition();
                    },
                    child: Text("Press")))
          ],
        ),
      ),
    ));
  }
}
