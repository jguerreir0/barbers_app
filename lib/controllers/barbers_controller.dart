import 'package:barberz/models/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BarbersController extends GetxController {
  Rxn<List<BarberModel>> _barbers = Rxn<List<BarberModel>>();
  String _collection = "barbers";
  BarberModel? currentBarber;

  List<BarberModel>? get barbers => _barbers.value;

  @override
  void onInit() {
    _barbers.bindStream(getBarbers());
    super.onInit();
  }

  Stream<List<BarberModel>> getBarbers() => FirebaseFirestore.instance
      .collection(_collection)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => BarberModel.fromJson(item.data())).toList());
}
