import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/controllers/home_controller.dart';
import 'package:barberz/presentation/auth/components/app_scaffold.dart';
import 'package:barberz/presentation/auth/components/auth_components.dart';
import 'package:barberz/presentation/home/barbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return AppScaffold(
          hasBottomNav: true,
          currentNavigationIndex: controller.tabIndex,
          onChangeTab: controller.changeTabIndex,
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              BarbersPage(),
              Center(
                child: ActionButton(
                    text: 'LOGOUT', onTap: () => authController.logout()),
              )
            ],
          ));
    });
  }
}
