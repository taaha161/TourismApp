import 'package:flutter/material.dart';
import 'dart:async';
import 'package:newapp/Model/location_details.dart';
import 'package:newapp/Model/style.dart';
import 'package:newapp/homepage.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<LocationDetails> object = [];
  bool loader = false;

  _LocationListState();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Locations",
          style: Style.navStyle(),
        )),
        body: RefreshIndicator(
            onRefresh: loadData,
            child: Column(
              children: [
                indicator(context),
                Expanded(
                  child: ListView.builder(
                      itemCount: object.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          reverse: false,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(index))),
                            child: Container(
                              height: 250,
                              child: Stack(children: [
                                _getThumbnail(index),
                                _getTitle(index)
                              ]),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }

  Future<void> loadData() async {
    if (mounted) {
      setState(() {
        loader = true;
      });
      Timer(Duration(milliseconds: 2000), () async {
        final locations = await LocationDetails.fetchAll();
        setState(() {
          object = locations;
          loader = false;
        });
      });
    }
  }

  Widget indicator(BuildContext context) {
    if (loader == true) {
      return const LinearProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      );
    } else {
      return Container();
    }
  }

  Widget _getThumbnail(index) {
    if (object[index].url.isNotEmpty) {
      try {
        return Container(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
              object[index].url,
              fit: BoxFit.cover,
            ));
      } catch (e) {
        print("Could not load image ${object[index].url}");
        return Container();
      }
    } else {
      print("Could not load image ${object[index].url}");
      return Container();
    }
  }

  Widget _getTitle(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          //height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Column(
            children: [
              Text(
                object[index].name.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                object[index].userItinerarySummary.toUpperCase(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              Text(object[index].tourPackageName.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
