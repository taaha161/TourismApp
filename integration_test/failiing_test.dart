import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:newapp/Model/location_facts.dart';
import 'package:newapp/app.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("App test example", (WidgetTester tester) async {
    runApp(const App());

    // wait until we are completely done loading our screen
    // await tester.pumpAndSettle();

    // //final mockLocation = LocationFacts.fetch(0);

    // // NOTE: 'skipOffstage' below is used just in case any of the items we are findings
    // // are off screen, since the first screen is a ListView
    // // WARNING: `find.text()` is case sensitive, so since we are rendering upper
    // // case items in our list view, we must find it via `toUpperCase()` here.
    // // An alternative would be to find a widget by its 'key' but since this is a
    // // simple app, there isn't as much of a need.
    // expect(find.text(mockLocation.title, skipOffstage: false),
    //     findsOneWidget);
    // expect(find.text('${mockLocation.title}blah', skipOffstage: false),
    //     findsNothing);
  });
}
