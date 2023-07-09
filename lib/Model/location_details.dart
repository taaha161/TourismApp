import 'package:json_annotation/json_annotation.dart';
import 'package:newapp/Model/endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newapp/Model/location_facts.dart';
part 'location_details.g.dart';

@JsonSerializable()
class LocationDetails {
  final String url;
  final String name;
  final int id;
  final String userItinerarySummary;
  final String tourPackageName;

  //
  final List<LocationFacts> facts;
  //final List<LocationFacts> facts;

  LocationDetails(this.url, this.name, this.id, this.userItinerarySummary,
      this.tourPackageName, this.facts);

  LocationDetails.blank()
      : userItinerarySummary = '',
        facts = [],
        tourPackageName = '',
        id = 0,
        name = ' ',
        url = '';
  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return _$LocationDetailsFromJson(json);
  }
  Map<String, dynamic> json() {
    return _$LocationDetailsToJson(this);
  }

  static Future<List<LocationDetails>> fetchAll() async {
    var uri = Endpoint.server('/locations', queryParameters: {});
    final resp = await http.get(uri);
    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<LocationDetails> list = <LocationDetails>[];
    for (var jsonItem in jsonDecode(resp.body)) {
      list.add(LocationDetails.fromJson(jsonItem));
    }
    return list;
  }

  static Future<LocationDetails> fetchByID(int id) async {
    var uri = Endpoint.server('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    final Map<String, dynamic> itemMap = jsonDecode(resp.body);
    return LocationDetails.fromJson(itemMap);
  }
}
