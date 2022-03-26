import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/controllers/barbers_controller.dart';
import 'package:barberz/presentation/home/components/barbers_list.dart';
import 'package:barberz/presentation/home/components/text_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarbersPage extends GetWidget<BarbersController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLabel(content: 'Bem-vindo ${authController.user!.email}'),
          const SizedBox(height: 30),
          TextLabel(content: 'Escolha o seu barbeiro', fontSize: 16),
          const SizedBox(height: 30),
          controller.barbers == null
              ? Center(child: CircularProgressIndicator())
              : BarbersList(barbersList: controller.barbers!),
        ],
      );
    });
  }
}
