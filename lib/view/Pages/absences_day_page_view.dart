import 'package:flutter/material.dart';
import 'package:uni/model/absence_page_model.dart';
import 'general_page_view.dart';

class AbsencesDayPageView extends StatefulWidget {
  final String course;
  final List<Absence> absences;

  AbsencesDayPageView(
  {Key key,
  @required this.course,
  @required this.absences});

  @override
  State<StatefulWidget> createState() => AbsencesPageViewState(
    course: course,
    absences: absences
  );
}

class AbsencesPageViewState extends GeneralPageViewState {
  AbsencesPageViewState({Key key,
  @required this.course,
  @required this.absences});

  final String course;
  final List<Absence> absences;

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.createAbsencesDayColumns(context, course),
          ),
        )
      ],
    );
  }

  List<Widget> createAbsencesDayColumns(BuildContext context, String course){
    final List<Widget> columns = <Widget>[];
    columns.add(absenceDayPageTitle());


    absences.forEach((item){
      columns.add(absenceDayWidget(item));
    });


    columns.add(absenceDayGoBack());

    return columns;
  }

  Widget absenceDayPageTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('Faltas a ' + course,
          style: TextStyle( fontSize: 40)),
    );
  }

  Widget absenceDayWidget(Absence absence) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(absence.day,
                      style: TextStyle(color:Colors.black, fontSize: 20)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(absence.weekDay + ', ' + absence.time,
                      style: TextStyle(color:Colors.black, fontSize: 18)),
                ],
              )
            ]
        ),
      ),
    );
  }

  Widget absenceDayGoBack() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {Navigator.pop(context);},
        child: const Text('Voltar a Faltas'),
      ),
    );
  }


}