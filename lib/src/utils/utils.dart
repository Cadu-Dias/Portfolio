import 'dart:convert';

import 'package:flutter/services.dart';

class Utility {
  late List _timelinePointsList;
  late String response;
  late dynamic data;

  Future<List> _geraListaTimeline() async {
    response = await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    _timelinePointsList = data["timeline_point"];
    return _timelinePointsList;
  }

  List retornaTimelinePointsList() {
    _geraListaTimeline();
    return _timelinePointsList;
  }
}
