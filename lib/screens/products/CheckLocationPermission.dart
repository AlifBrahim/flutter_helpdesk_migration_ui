import 'package:permission_handler/permission_handler.dart';

void checkLocationPermission() async {
  var status = await Permission.location.status;
  if (!status.isGranted) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    status = await Permission.location.request();
  }

  switch (status) {
    case PermissionStatus.denied:
      print('Location permission is denied');
      break;
    case PermissionStatus.permanentlyDenied:
    // The OS restricts access, for example because of parental controls.
      print('Location permission is permanently denied');
      break;
    case PermissionStatus.restricted:
    // The OS restricts access, for example because of parental controls.
      print('Location permission is restricted');
      break;
    case PermissionStatus.granted:
    // You can request the permission.
      print('Location permission is granted');
      break;
    case PermissionStatus.limited:
    // On iOS this means that the permission is granted only once.
      print('Location permission is limited');
      break;
    case PermissionStatus.provisional:
    // On iOS this means that the permission is granted only once.
      print('Location permission is provisional');
      break;
  }
}
