import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class Utils {
 static String extractCountryCode(String displayName) {
    final regex = RegExp(r'\[\+(\d+)\]');
    final match = regex.firstMatch(displayName);
    if (match != null && match.groupCount > 0) {
      return '(+${match.group(1)})';
    } else {
      return '';
    }
  }
  static bool isRtl(BuildContext context) {
    if (Directionality.of(context) == TextDirection.rtl) {
      return true;
    }
    return false;
  }

  Future<List<LatLng>> getRoutePoints(LatLng origin, LatLng destination) async {
    final String apiKey = 'AIzaSyAp3YV5lzkGNpZiUwupo-oqXZ-A6E-a7Vc';
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final points = decodePolyline(data['routes'][0]['overview_polyline']['points']);
      print('Fetched points: $points'); // Debug print

      return points;
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      LatLng point = LatLng(lat / 1E5, lng / 1E5);
      polyline.add(point);
    }

    return polyline;
  }
}
