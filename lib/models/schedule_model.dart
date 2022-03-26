import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleModel {
  static const ID = "id";
  static const NAMECLIENT = "name_client";
  static const IDCLIENT = "id_client";
  static const NAMEBARBER = "name_barber";
  static const IDBARBER = "id_barber";
  static const DATETIME = "date_time";

  final String? id;
  final String nameClient;
  final String idClient;
  final String nameBarber;
  final String idBarber;
  final DateTime dateTime;

  ScheduleModel(
      {this.id,
      required this.nameBarber,
      required this.nameClient,
      required this.dateTime,
      required this.idBarber,
      required this.idClient});

  ScheduleModel.fromJson(Map<String, dynamic> json)
      : nameClient = json[NAMECLIENT],
        id = json[ID],
        idBarber = json[IDBARBER],
        idClient = json[IDCLIENT],
        dateTime = DateTime.fromMillisecondsSinceEpoch(json[DATETIME]),
        nameBarber = json[NAMEBARBER];

  Map<String, dynamic> toJson() {
    return {
      IDBARBER: idBarber,
      NAMEBARBER: nameBarber,
      IDCLIENT: idClient,
      NAMECLIENT: nameClient,
      DATETIME: dateTime.millisecondsSinceEpoch,
    };
  }
}

class ScheduleDataSource extends CalendarDataSource {
  ScheduleDataSource(List<Appointment>? source) {
    appointments = source;
  }
}
