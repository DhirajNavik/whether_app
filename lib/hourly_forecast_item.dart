import 'package:flutter/material.dart';

class HourlForecastItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temp;

  const HourlForecastItem({
    super.key,
    required this.icon,
    required this.time,
    required this.temp,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Text(
            time,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            temp,
            style: TextStyle(fontSize: 14),
          )
        ]),
      ),
    );
  }
}
