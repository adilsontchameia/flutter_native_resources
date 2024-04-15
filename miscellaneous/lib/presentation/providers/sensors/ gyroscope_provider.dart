import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

final gyroscopeProvider =
    StreamProvider.autoDispose<GyroscopeXYZ>((ref) async* {
  await for (final event in gyroscopeEventStream()) {
    final x = double.parse((event.x.toStringAsFixed(2)));
    final y = double.parse((event.x.toStringAsFixed(2)));
    final z = double.parse((event.x.toStringAsFixed(2)));
    yield GyroscopeXYZ(x, y, z);
  }
});

class GyroscopeXYZ {
  final double x;
  final double y;
  final double z;

  GyroscopeXYZ(
    this.x,
    this.y,
    this.z,
  );

  @override
  String toString() {
    return '''
    x: $x,
    y: $y,
    z: $z,
    ''';
  }
}
