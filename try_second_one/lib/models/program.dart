import 'dart:convert';

// List<Program> programFromJson(String str) =>
//     List<Program>.from(json.decode(str).map((x) => Program.fromJson(x)));

// String programToJson(List<Program> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Program {
  Program({
    required this.vegetables,
    required this.fruits,
    required this.dairy,
    required this.id,
  });

  List<String> vegetables;
  List<String> fruits;
  List<String> dairy;
  int id;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        vegetables: List<String>.from(json["Vegetables"].map((x) => x)),
        fruits: List<String>.from(json["Fruits"].map((x) => x)),
        dairy: List<String>.from(json["Dairy"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Vegetables": List<dynamic>.from(vegetables.map((x) => x)),
        "Fruits": List<dynamic>.from(fruits.map((x) => x)),
        "Dairy": List<dynamic>.from(dairy.map((x) => x)),
        "id": id,
      };
}
