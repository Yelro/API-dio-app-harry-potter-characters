import 'dart:convert';
import 'potter.dart';

PottersResponse pottersResponseFromJson(String str) =>
    PottersResponse.fromJson(json.decode(str));

String eventsResponseToJson(PottersResponse data) =>
    json.encode(data.toJson());

class PottersResponse {
  PottersResponse({
    required this.potters,
  });

  final List<Potter> potters;

  factory PottersResponse.fromJson(List<dynamic> json) {
    List<Potter> potters =
        json.map((potterJson) => Potter.fromJson(potterJson)).toList();
    return PottersResponse(potters: potters);
  }

  Map<String, dynamic> toJson() => {
        "potters": List<dynamic>.from(potters.map((x) => x.toJson())),
      };
}
