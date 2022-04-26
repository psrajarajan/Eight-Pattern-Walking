// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.5,
      height: width * 0.5,
      child: _buildCompass(),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;
        if (direction == null)
          return const Center(
            child: Text("Device does not have sensors !"),
          );

        return Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: ((direction) * (math.pi / 180) * -1),
            child: Image.asset('assets/images/compass_image.png'),
          ),
        );
      },
    );
  }
}
