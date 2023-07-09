import 'package:flutter/material.dart';
import 'Model/location_details.dart';
import 'Model/style.dart';

class HomePage extends StatefulWidget {
  final int id;
  const HomePage(this.id, {super.key});
  @override
  createState() => _homePageState(this.id);
}

class _homePageState extends State<HomePage> {
  final int index;
  LocationDetails object = LocationDetails.blank();
  _homePageState(this.index);

  @override
  void initState() {
    super.initState();
    loadData(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          object.name,
          style: Style.navStyle(),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _getFacts()),
    );
  }

  loadData(int id) async {
    final location = await LocationDetails.fetchByID(id + 1);
    if (mounted) {
      setState(() {
        object = location;
      });
    }
  }

  List<Widget> _getFacts() {
    List<Widget> result = [];
    result.add(_getImage(object.url, 300));
    for (int i = 0; i < object.facts.length; i++) {
      result.add(_getTitle(object.facts[i].title));
      result.add(_getSummary(object.facts[i].text));
    }
    return result;
  }

  Widget _getTitle(String title) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 10, 25, 5),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Style.headingStyle(),
        ));
  }

  Widget _getSummary(String title) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Style.bodyStyle(),
        ));
  }

  Widget _getImage(String url, double height) {
    return Container(
      // padding: const EdgeInsets.all(200),
      //margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
      ),
      constraints: BoxConstraints.tightFor(height: height),
    );
  }
}
