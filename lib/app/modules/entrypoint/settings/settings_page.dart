import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../common/custom_container.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);
  static const String ROUTE_PAGE = '/setttings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomContainer(
          containerContent: const Center(
            child: Text('Settings'),
          ),
        ),
      ),
    );
  }
}
