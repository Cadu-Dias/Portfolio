import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<List> retornaTimelinePointsList() async {
    await _geraListaTimeline();
    return _timelinePointsList;
  }

  static void openGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'cadubas1@gmail.com',
      query: 'subject=E-mail de contatação&body=Fique a vontade para me contatar: ',
    );
    String url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
