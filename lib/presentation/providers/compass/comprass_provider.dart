import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_native_resources/my_app/app.dart';

final compassProvider = StreamProvider<double?>((ref) async* {
  if (FlutterCompass.events == null) {
    throw Exception('Device does not has sensors');
  }

  try {
    await for (final event in FlutterCompass.events!) {
      yield event.heading;
    }
  } catch (e) {
    throw Exception('Error getting heading $e');
  }
});
