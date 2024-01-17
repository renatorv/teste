import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:teste/app/core/ui/temas.dart';
import 'package:teste/app/modules/entrypoint/settings/settings_page.dart';
import 'package:teste/app/modules/entrypoint_controller.dart';

// import 'core/utils/responsive.dart';
import 'modules/entrypoint/home/home_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pageList = const [
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Responsive responsive = Responsive(context);
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
                data: Theme.of(context).copyWith(canvasColor: kDark),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                  selectedIconTheme: const IconThemeData(color: kPrimary),
                  onTap: (value) {
                    print(value);
                    controller.setTabIndex = value;
                  },
                  currentIndex: controller.tabIndex,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(AntDesign.home),
                      //icon: controller.tabIndex == 0 ? const Icon(AntDesign.appstore1) : const Icon(AntDesign.appstore_o),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AntDesign.setting),
                      label: 'Configurações',
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



// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:foodly/constants/constants.dart';
// import 'package:foodly/controllers/tab_index_controller.dart';
// import 'package:foodly/views/cart/cart_page.dart';
// import 'package:foodly/views/home/home_page.dart';
// import 'package:foodly/views/profile/profile_page.dart';
// import 'package:foodly/views/search/search_page.dart';
// import 'package:get/get.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// class MainScreen extends StatelessWidget {
//   MainScreen({super.key});

//   List<Widget> pageList = const [
//     HomePage(),
//     SearchPage(),
//     CartPage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TabIndexController());
//     return Obx(
//       () => Scaffold(
//         body: Stack(
//           children: [
//             pageList[controller.tabIndex],
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Theme(
//                 data: Theme.of(context).copyWith(canvasColor: kPrimary),
//                 child: BottomNavigationBar(
//                   showSelectedLabels: false,
//                   showUnselectedLabels: false,
//                   unselectedIconTheme: const IconThemeData(color: Colors.black38),
//                   selectedIconTheme: const IconThemeData(color: kSecondary),
//                   onTap: (value) {
//                     controller.setTabIndex = value;
//                   },
//                   currentIndex: controller.tabIndex,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: controller.tabIndex == 0 ? const Icon(AntDesign.appstore1) : const Icon(AntDesign.appstore_o),
//                       label: 'Home',
//                     ),
//                     const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//                     const BottomNavigationBarItem(
//                       icon: Badge(
//                         label: Text('1'),
//                         child: Icon(FontAwesome.opencart),
//                       ),
//                       label: 'Cart',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: controller.tabIndex == 3 ? const Icon(FontAwesome.user_circle) : const Icon(FontAwesome.user_circle_o),
//                       label: 'Profile',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }