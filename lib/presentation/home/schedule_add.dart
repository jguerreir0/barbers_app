import 'package:barberz/presentation/auth/components/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ScheduleAdd extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _mapParams = {};

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('Escolha um horário'),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime.utc(2019, 12, 31, 23, 12, 34),
                      locale: LocaleType.de);
                },
                child: Text(
                  'Clique aqui para selecionar a hora',
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
