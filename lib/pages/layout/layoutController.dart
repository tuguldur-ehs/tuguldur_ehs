import 'dart:developer';

import 'package:get/get.dart';
import 'package:hab_security_fornt/core/utils/token_preference.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var tokenInfo = "".obs;

  @override
  void onInit() async {
    super.onInit();
    String? token = await TokenPreference.getToken();
    log("token=shuu>$token");
    if (token != null && token.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      log("Decoded Token => $decodedToken");

      tokenInfo.value = decodedToken['username'];
      log("tokenInfo=shuu>${tokenInfo.value}");
    } else {
      log("Token not found or empty");
    }
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
