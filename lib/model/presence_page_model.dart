import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/presence_page_view.dart';

import 'entities/lecture.dart';

class PresencePage extends StatefulWidget {
  //Handle arguments from parent
  const PresencePage({Key key}) : super(key: key);

  @override
  _PresencePageState createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  String name;
  String email;
  List<Lecture> lectures;
  String day;
  int weekDay, currentHour, currentMinute;

  @override
  void initState() {
    super.initState();
    name = '';
    email = '';
    lectures = <Lecture>[];
    day = '';
    weekDay = 0; currentHour = 0; currentMinute = 0;
  }

  @override
  Widget build(BuildContext context) {
    updateInfo();
    return PresencePageView(
        name: name,
        day: day,
        email: email,
        lectures: lectures,
        weekDay: weekDay,
        currentHour: currentHour,
        currentMinute: currentMinute);
  }

  void updateInfo() async {
    day = DateTime.now().day.toString();
    weekDay = DateTime.now().weekday - 1; //weekday: week starts at monday with the value 1.
    currentHour = DateTime.now().hour;
    currentMinute = DateTime.now().minute;

    setState(() {
      if (StoreProvider.of<AppState>(context).state.content['profile'] !=
          null) {
        email =
            StoreProvider.of<AppState>(context).state.content['profile'].email;
        lectures =
        StoreProvider.of<AppState>(context).state.content['schedule'];
        name = StoreProvider.of<AppState>(context).state.content['profile'].name;
      }
    });
  }
}