import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});

//Notifier => Class with as property named state according to our choices
class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState()) {
    checkPermissions();
  }
  Future<void> checkPermissions() async {
    final permissionArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);
    state = state.copyWith(
      camera: permissionArray[0],
      photoLibrary: permissionArray[1],
      sensors: permissionArray[2],
      location: permissionArray[3],
      locationAlways: permissionArray[4],
      locationWhenInUse: permissionArray[5],
    );
  }

  Future<void> requestCamera() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestPhotoLibrary() async {
    final status = await Permission.photos.request();
    state = state.copyWith(photoLibrary: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestSensors() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestLocation() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requesLocationAlways() async {
    final status = await Permission.locationAlways.request();
    state = state.copyWith(locationAlways: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestLocationWhenInUse() async {
    final status = await Permission.locationWhenInUse.request();
    state = state.copyWith(locationWhenInUse: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}

class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranded {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionsState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
