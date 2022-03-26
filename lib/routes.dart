import 'package:barberz/presentation/auth/login.dart';
import 'package:barberz/presentation/auth/signup.dart';
import 'package:barberz/presentation/home/home.dart';
import 'package:barberz/presentation/home/schedule.dart';
import 'package:barberz/presentation/home/schedule_add.dart';
import 'package:barberz/presentation/root.dart';
import 'package:get/get.dart';

class Routes {
  static final String root = '/';
  static final String login = '/login';
  static final String signup = '/signup';
  static final String home = '/home';
  static final String schedule = '/schedule';
  static final String scheduleAdd = '/schedule/add';

  static List<GetPage> routes = [
    GetPage(name: root, page: () => Root()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signup, page: () => SignUpPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: schedule, page: () => SchedulePage()),
    GetPage(name: scheduleAdd, page: () => ScheduleAdd()),
  ];
}
