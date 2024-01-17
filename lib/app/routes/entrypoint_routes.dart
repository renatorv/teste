import 'package:get/get.dart';
import 'package:teste/app/modules/entrypoint/home/home_bindings.dart';
import 'package:teste/app/modules/entrypoint/home/home_page.dart';

import '../modules/entrypoint/settings/settings_bindings.dart';
import '../modules/entrypoint/settings/settings_page.dart';

class EntrypointRoutes {
  EntrypointRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),

        GetPage(
      name: SettingsPage.ROUTE_PAGE,
      page: () => const SettingsPage(),
      binding: SettingsBindings(),
    ),
  ];
}
