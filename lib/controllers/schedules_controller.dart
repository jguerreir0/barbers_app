import 'package:barberz/controllers/barbers_controller.dart';
import 'package:barberz/models/barber_model.dart';
import 'package:barberz/models/schedule_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulesController extends GetxController {
  final barberController = Get.find<BarbersController>();
  Rxn<List<Appointment>> _schedules = Rxn<List<Appointment>>();
  String _collection = "schedules";

  List<Appointment>? get schedules => _schedules.value;

  @override
  void onInit() {
    _schedules
        .bindStream(getSchedules(barberId: barberController.currentBarber!.id));
    super.onInit();
  }

  addSchedule(Map<String, dynamic> params) async => FirebaseFirestore.instance
          .collection(_collection)
          .add(params)
          .then((value) {
        update();
        print(value.id);
        Get.snackbar('Sucesso', 'A sua marcação foi agendada',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });

  Stream<List<Appointment>> getSchedules({required String barberId}) =>
      FirebaseFirestore.instance
          .collection(_collection)
          .where("id_barber", isEqualTo: barberId)
          .snapshots()
          .map(
            (query) => query.docs.map(
              (item) {
                final schedule = ScheduleModel.fromJson(item.data());

                return Appointment(
                  subject: 'SALAMALEKO',
                  color: Colors.red,
                  notes: 'Corte de Cabelo',
                  location: 'Ferreiras',
                  startTime: schedule.dateTime,
                  endTime: schedule.dateTime.add(
                    Duration(minutes: 30),
                  ),
                );
              },
            ).toList(),
          );

  containsAppointment(DateTime date) {
    for (Appointment appoinment in schedules!) {
      if (appoinment.startTime.isAtSameMomentAs(date)) {
        return true;
      }
    }
    return false;
  }
}
