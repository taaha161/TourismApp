import 'package:flutter_test/flutter_test.dart';
import 'package:newapp/Model/location_details.dart';

void main() {
  test('locations not empty', () async {
    final List<LocationDetails> locations = await LocationDetails.fetchAll();
    expect(locations, isNotEmpty);
  });
}
