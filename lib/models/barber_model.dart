class BarberModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGEURL = "img_url";
  static const PHONENUMBER = "phone_number";

  final id;
  final name;
  final imgUrl;
  final phoneNumber;

  BarberModel(this.id, this.name, this.imgUrl, this.phoneNumber);

  BarberModel.fromJson(Map<String, dynamic> json)
      : name = json[NAME],
        id = json[ID],
        imgUrl = json[IMAGEURL],
        phoneNumber = json[PHONENUMBER];
}
