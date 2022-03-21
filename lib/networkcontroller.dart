import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionstatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitysubscription;
  @override
  void onInit() {
    super.onInit();
    initconnectivity();
    connectivitysubscription =
        _connectivity.onConnectivityChanged.listen(updateconnectionstatus);
  }

  initconnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateconnectionstatus(result);
  }

  updateconnectionstatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionstatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionstatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionstatus.value = 0;
        break;
      default:
        Get.snackbar('network error', 'failed to get network connection');
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    connectivitysubscription.cancel();
  }
}
