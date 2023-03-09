import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uni/model/entities/lecture.dart';
import 'general_page_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/request_page_model.dart';


class PresencePageView extends StatefulWidget {
  final String name;
  final String email;
  final List<Lecture> lectures;
  final String day;
  final int weekDay, currentHour, currentMinute;

  PresencePageView(
      {Key key,
        @required this.name,
        @required this.day,
        @required this.email,
        @required this.lectures,
        @required this.weekDay,
        @required this.currentHour,
        @required this.currentMinute});

  @override
  State<StatefulWidget> createState() => PresencePageViewState(
      name: name,
      email: email,
      lectures: lectures,
      weekDay: weekDay,
      currentHour: currentHour,
      currentMinute: currentMinute, day: day);
}

class PresencePageViewState extends GeneralPageViewState {

  PresencePageViewState(
      {Key key,
        @required this.name,
        @required this.email,
        @required this.lectures,
        @required this.weekDay,
        @required this.currentHour,
        @required this.currentMinute,
        @required this.day});

  final String name, day;
  final String email;
  final List<Lecture> lectures;
  final int weekDay, currentHour, currentMinute;
  bool requested = false;

  Lecture getCurrentClass(){
    for(int i = 0; i < lectures.length; i++){
      if(checkIfSameTime(lectures[i])){
        return lectures[i];
      }
    }
    return null;

  }

  bool checkIfSameTime(Lecture lecture){
    final int startHour = int.parse(lecture.startTime.substring(0, 2));
    final int endHour = int.parse(lecture.endTime.substring(0, 2));
    final int startMinute = int.parse(lecture.startTime.substring(3, 5));
    final int endMinute = int.parse(lecture.startTime.substring(3, 5));

    if(lecture.day != weekDay){
      return false;
    }
    if(startHour > currentHour || endHour < currentHour){
      return false;
    }
    if(startHour == currentHour && startMinute > currentMinute){
      return false;
    }
    if(endHour == currentHour && endMinute <= currentMinute){
      return false;
    }
    return true;
  }
  RequestController req = RequestController();

  Widget getQRcode(BuildContext context){
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: QrImage(
                  key: Key('Qr_code'),
                  data: email + getCurrentClass().subject + getCurrentClass().classNumber,
                  size: 350
              ),
            ),
            SizedBox(height: 15),
            Text('Estás a ter ' + getCurrentClass().subject,
                style: TextStyle(
                    fontSize: 30
                )),
            SizedBox(height: 140),
            ElevatedButton.icon(
              onPressed: () {
                String text;
                if(!requested) {
                  text = "Pediste para te marcar presença a " +
                      getCurrentClass().subject;
                  req.insert(Request(name, getCurrentClass().subject, day, false, true));
                  requested = true;
                }
                else{
                  text = "Já tinhas pedido para te marcar presença a " +
                      getCurrentClass().subject;
                }
                showSimpleNotification(
                  Text(text),
                  key: Key("Request_notification"),
                );
              },
              icon: Icon(Icons.add, size: 30),
              label: Text('Pedir para marcar presença'),
              key: Key('Request_button'),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                launch('mailto:secdei@fe.up.pt?subject=Justificar falta&body=Bom dia, gostaria de justificar faltas do dia '
                    'Atenciosamente, ');
              },
              icon: Icon(Icons.add, size: 30),
              label: Text('Justificar faltas'),
              key: Key('justifyEmail'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    final Lecture currentClass = getCurrentClass();
    if(currentClass == null){
      return Center(
          child: Text('Não estás a ter nenhuma aula no momento')
      );
    }
    else if(currentClass.typeClass == 'T'){
      return Center(
          child: Text('Estás a ter aula teórica de ' + currentClass.subject)
      );
    }
    else{
      return getQRcode(context);
    }
  }
}