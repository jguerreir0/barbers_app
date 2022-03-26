import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/controllers/barbers_controller.dart';
import 'package:barberz/controllers/home_controller.dart';
import 'package:barberz/controllers/schedules_controller.dart';
import 'package:get/get.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<BarbersController>(() => BarbersController(), fenix: true);
    Get.lazyPut<SchedulesController>(() => SchedulesController(), fenix: true);
  }
}
