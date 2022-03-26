import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/controllers/barbers_controller.dart';
import 'package:barberz/controllers/schedules_controller.dart';
import 'package:barberz/models/barber_model.dart';
import 'package:barberz/models/schedule_model.dart';
import 'package:barberz/presentation/auth/components/app_scaffold.dart';
import 'package:barberz/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends GetWidget<SchedulesController> {
  final authController = Get.find<AuthController>();
  final barberController = Get.find<BarbersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppScaffold(
          body: controller.schedules == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SfCalendar(
                  backgroundColor: Colors.grey.shade300,
                  todayHighlightColor: Colors.red,
                  selectionDecoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  dataSource: ScheduleDataSource(controller.schedules!),
                  onLongPress: (date) {
                    if (!controller.containsAppointment(date.date!)) {
                      //final BarberModel barber = Get.arguments['barber'];
                      controller.addSchedule(ScheduleModel(
                              dateTime: date.date!,
                              idBarber: barberController.currentBarber!.id,
                              idClient: authController.user!.uid,
                              nameBarber: barberController.currentBarber!.name,
                              nameClient: authController.user!.email!)
                          .toJson());
                    } else {
                      Get.snackbar(
                          'Erro', 'Já existe uma marcação para este horário',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    }
                  },
                  timeSlotViewSettings: TimeSlotViewSettings(
                      startHour: 10,
                      endHour: 19,
                      nonWorkingDays: <int>[
                        DateTime.sunday,
                      ],
                      timeFormat: 'HH:mm',
                      dayFormat: 'E',
                      timeInterval: Duration(minutes: 30),
                      timeRulerSize: 35),
                  view: CalendarView.workWeek,
                  firstDayOfWeek: 1,
                  monthViewSettings: const MonthViewSettings(showAgenda: true),
                ));
    });
  }
}
