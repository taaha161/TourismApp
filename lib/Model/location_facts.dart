import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:newapp/Model/location_details.dart';

part 'location_facts.g.dart';

@JsonSerializable()
class LocationFacts {
  final String title;
  final String text;
  LocationFacts(this.title, this.text);

  static const locationData =
      '{"title" : "Lahore, Pakistan", "summary" : "This is Lahore, Pakistan", "image" : "https://picsum.photos/200/300"}';

  static Map<String, dynamic> locationMap = jsonDecode(locationData);
  static var location = LocationDetails.fromJson(locationMap);

  factory LocationFacts.fromJson(Map<String, dynamic> json) =>
      _$LocationFactsFromJson(json);
}
