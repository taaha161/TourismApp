// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) {
  try {
    return LocationDetails(
      json['url'] as String,
      json['name'] as String,
      json['id'] as int,
      json['user_itinerary_summary'] as String,
      json['tour_package_name'] as String,
      (json['facts'] as List<dynamic>)
          .map((e) => LocationFacts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  } catch (exception) {
    return LocationDetails(
        json['url'] as String,
        json['name'] as String,
        json['id'] as int,
        json['user_itinerary_summary'] as String,
        json['tour_package_name'] as String, []);
  }
}

Map<String, dynamic> _$LocationDetailsToJson(LocationDetails instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'id': instance.id,
      'user_itinerary_summary': instance.userItinerarySummary,
      'tour_package_name': instance.tourPackageName,
      'facts': instance.facts,
    };
