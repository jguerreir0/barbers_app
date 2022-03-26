import 'package:barberz/controllers/barbers_controller.dart';
import 'package:barberz/models/barber_model.dart';
import 'package:barberz/presentation/home/components/barber_card.dart';
import 'package:barberz/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarbersList extends StatelessWidget {
  final List<BarberModel> barbersList;

  const BarbersList({Key? key, required this.barbersList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barberController = Get.find<BarbersController>();

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, i) {
          final barber = barbersList[i];

          return Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white38,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onTap: () {
                barberController.currentBarber = barber;
                Get.toNamed(Routes.schedule);
              },
              child: BarberCard(imgUrl: barber.imgUrl, name: barber.name),
            ),
          );
        },
        separatorBuilder: (context, i) {
          return SizedBox(height: 30);
        },
        itemCount: barbersList.length,
      ),
    );
  }
}
