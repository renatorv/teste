import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:teste/app/core/ui/temas.dart';
import 'package:teste/app/modules/entrypoint/settings/settings_page.dart';

import 'core/utils/responsive.dart';
import 'entrypoint_controller.dart';
import 'modules/entrypoint/home/home_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pageList = const [
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final controller = Get.put(EntrypointController());
    return Obx(
      () => Scaffold(
        bottomSheet: Container(
        height: 6,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.5, 0],
            colors: [
              kPrimary,
              kSecondary,
            ],
          ),
        ),
      ),
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kOffBlack),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  elevation: 2,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                  selectedIconTheme: const IconThemeData(color: kPrimary),
                  onTap: (value) {
                    print(value);
                    controller.setTabIndex = value;
                  },
                  currentIndex: controller.tabIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: controller.tabIndex == 0
                          ? Icon(Ionicons.home, size: responsive.dp(4.2))
                          : Icon(Ionicons.home_outline, size: responsive.dp(4.2)),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: controller.tabIndex == 0
                          ? Icon(Ionicons.settings_outline, size: responsive.dp(4.2))
                          : Icon(Ionicons.settings, size: responsive.dp(4.2)),
                      label: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}