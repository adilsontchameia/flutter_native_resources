import 'package:go_router/go_router.dart';

import '../../features/native_resources/screen.dart';
import '../../features/native_resources/sensors/acelerometer_screen.dart';
import '../../features/native_resources/sensors/compass_screen.dart';
import '../../features/native_resources/sensors/gyroscope_ball_screen.dart';
import '../../features/native_resources/sensors/gyroscope_screen.dart';
import '../../features/native_resources/sensors/magnetometer_screen.dart';

final router = GoRouter(
  routes: [
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
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),

    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return PokemonScreen(
                pokemonId: id ?? 1.toString(),
              );
            })
      ],
    ),
  ],
);
