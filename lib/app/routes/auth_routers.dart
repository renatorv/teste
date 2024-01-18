import 'package:get/get.dart';

import '../modules/auth/login/login_bindings.dart';
import '../modules/auth/login/login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
        GetPage(
      name: '/',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
