import 'package:flutter/material.dart';
import 'package:flutter_native_resources/features/native_resources/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionProvider);
    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Camera'),
          subtitle: Text('${permissions.camera}'),
          onChanged: (_) {
            ref.read(permissionProvider.notifier).requestCamera();
          },
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranded,
          title: const Text('Photo Library'),
          subtitle: Text('${permissions.photoLibrary}'),
          onChanged: (_) {
            ref.read(permissionProvider.notifier).requestPhotoLibrary();
          },
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Location'),
          subtitle: Text('${permissions.location}'),
          onChanged: (_) {
            ref.read(permissionProvider.notifier).requestLocation();
          },
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensors'),
          subtitle: Text('${permissions.sensors}'),
          onChanged: (_) {
            ref.read(permissionProvider.notifier).requestSensors();
          },
        ),
      ],
    );
  }
}
