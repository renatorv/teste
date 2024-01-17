import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste/app/routes/entrypoint_routes.dart';

import 'app/core/ui/preferencia_tema.dart';
import 'app/core/ui/temas.dart';
import 'app/entrypoint.dart';

Widget defaultHome = const MainScreen();
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: kDark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    PreferenciaTema.setTema();
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    PreferenciaTema.setTema();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PreferenciaTema.tema,
      builder: (BuildContext context, Brightness tema, _) => GetMaterialApp(
        title: 'TBC Digital',
        debugShowCheckedModeBanner: false,
        darkTheme: Temas.darkTheme,
        theme: Temas.lightTheme,
        home: defaultHome,
        getPages: [
          ...EntrypointRoutes.routers,
        ],
      ),
    );
  }
}
