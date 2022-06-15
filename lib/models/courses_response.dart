class CoursesResponse {
  CoursesResponse({
    required this.id,
    required this.name,
    required this.note,
    required this.teacher,
  });

  String id;
  String name;
  int note;
  String teacher;

  factory CoursesResponse.fromJson(Map<String, dynamic> json) => CoursesResponse(
        id: json["id"],
        name: json["name"],
        note: json["note"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "note": note,
        "teacher": teacher,
      };
}
