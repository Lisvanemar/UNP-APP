class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.career,
    required this.universityId,
    required this.picture,
    required this.isActive,
    required this.currentPeriod,
    required this.contactParent,
    required this.lastUpdated,
  });

  String id;
  String name;
  String lastname;
  String phone;
  String email;
  String career;
  String universityId;
  String picture;
  bool isActive;
  String currentPeriod;
  ContactParent contactParent;
  String lastUpdated;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        career: json["career"],
        universityId: json["universityId"],
        picture: json["picture"],
        isActive: json["isActive"],
        currentPeriod: json["currentPeriod"],
        contactParent: ContactParent.fromJson(json["contactParent"]),
        lastUpdated: json["lastUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "career": career,
        "universityId": universityId,
        "picture": picture,
        "isActive": isActive,
        "currentPeriod": currentPeriod,
        "contactParent": contactParent.toJson(),
        "lastUpdated": lastUpdated,
      };
}

class ContactParent {
  ContactParent({
    required this.name,
    required this.lastname,
    required this.phone,
    required this.email,
  });

  String name;
  String lastname;
  String phone;
  String email;

  factory ContactParent.fromJson(Map<String, dynamic> json) => ContactParent(
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "email": email,
      };
}
