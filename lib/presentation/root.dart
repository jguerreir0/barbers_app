import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/presentation/auth/login.dart';
import 'package:barberz/presentation/home/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? HomePage()
          : LoginPage();
    });
  }
}
