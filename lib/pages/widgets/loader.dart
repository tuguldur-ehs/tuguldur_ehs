import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

var toastCancelFunc;

void fullLoader(bool status, {bool loaderHasShown = false}) {
  if (status) {
    if (toastCancelFunc != null) {
      toastCancelFunc();
    }
    toastCancelFunc =
        BotToast.showCustomLoading(toastBuilder: (void Function() cancelFunc) {
          return AnimatedOpacity(
            opacity: 0.8,
            duration: const Duration(seconds: 1),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.black.withOpacity(0.3),
                  backgroundBlendMode: BlendMode.color,
                ),
                child: Center(
                  child: Lottie.asset(
                    'assets/loader.json',
                  ),
                )),
          );
        });
  } else {
    if (toastCancelFunc != null) {
      toastCancelFunc();
      toastCancelFunc = null;
    }
  }
}
