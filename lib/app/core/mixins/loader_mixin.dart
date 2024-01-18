import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/temas.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(
      loading,
      (_) async {
        if (loading.isTrue) {
          await Get.dialog(
            const PopScope(
              canPop: true,
              child: Center(
                child: CircularProgressIndicator(
                  color: kSecondary,
                ),
              ),
            ),
            barrierDismissible: false,
          );
        } else {
          Get.back();
        }
      },
    );
  }
}
