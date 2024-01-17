import 'package:flutter/material.dart';

class PreferenciaTema {
  static final ValueNotifier<Brightness> tema = ValueNotifier(Brightness.light);

  static setTema() {
    tema.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }
}
