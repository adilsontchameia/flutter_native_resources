import 'package:flutter/material.dart';
import 'package:flutter_native_resources/features/native_resources/presentation/providers/sensors/%20gyroscope_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscópio'),
      ),
      body: Center(
        child: gyroscope$.when(
          data: (value) => Text(
            value.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
