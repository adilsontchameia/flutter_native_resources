import 'package:flutter_native_resources/presentation/screens/pokemons/pokemons_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screen.dart';
import '../../presentation/screens/sensors/acelerometer_screen.dart';
import '../../presentation/screens/sensors/compass_screen.dart';
import '../../presentation/screens/sensors/gyroscope_ball_screen.dart';
import '../../presentation/screens/sensors/gyroscope_screen.dart';
import '../../presentation/screens/sensors/magnetometer_screen.dart';

final router = GoRouter(routes: [
  //! General
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),

  GoRoute(
    path: '/permissions',
    builder: (context, state) => const PermissionsScreen(),
  ),

  //! Sensors
  GoRoute(
    path: '/gyroscope',
    builder: (context, state) => const GyroscopeScreen(),
  ),

  GoRoute(
    path: '/accelerometer',
    builder: (context, state) => const AccelerometerScreen(),
  ),

  GoRoute(
    path: '/magnetometer',
    builder: (context, state) => const MagnetometerScreen(),
  ),
  GoRoute(
    path: '/pokemons',
    builder: (context, state) => const PokemonsScreen(),
  ),

  GoRoute(
    path: '/gyroscope-ball',
    builder: (context, state) => const GyroscopeBallScreen(),
  ),

  GoRoute(
    path: '/compass',
    builder: (context, state) => const CompassScreen(),
  ),
]);
