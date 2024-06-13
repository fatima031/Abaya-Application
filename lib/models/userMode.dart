class UserModel {
  final String uId;
  final String userName;
  final String email;
  final String phone;
  final String userImage;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActvie;
  final dynamic createdOn;
  final String city;
  UserModel({
    required this.city,
    required this.uId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userImage,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActvie,
    required this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      "uId": uId,
      "username": userName,
      "email": email,
      "phone": phone,
      "userImage": userImage,
      "userDeviceToken": userDeviceToken,
      "country": country,
      "userAddress": userAddress,
      "street": street,
      "isAdmin": isAdmin,
      "isActive": isActvie,
      "createdOn": createdOn,
      "city": city
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
        uId: json["uId"],
        userName: json["userName"],
        email: json["email"],
        phone: json["phone"],
        userImage: json["userImage"],
        userDeviceToken: json["userDeviceToken"],
        country: json["country"],
        userAddress: json["userAddress"],
        street: json["street"],
        isAdmin: json["isAdmin"],
        isActvie: json["isActive"],
        city:  json['city'],
        createdOn: json["createdOn"].toString());
  }
}
