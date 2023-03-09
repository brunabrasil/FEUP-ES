import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/absences_day_page_view.dart';
import '../../model/absence_page_model.dart';
import 'general_page_view.dart';

class AbsencesPageView extends StatefulWidget {
  Map<String, List<Absence>> absences;

  AbsencesPageView(
      {Key key,
        @required this.absences});

  @override
  State<StatefulWidget> createState() => AbsencesPageViewState(
      absences: absences);
}

class AbsencesPageViewState extends GeneralPageViewState {
  AbsencesPageViewState({Key key,
    @required this.absences});

  Map<String, List<Absence>> absences;

  @override
  Widget getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.createAbsencesColumn(context, absences),
          ),
        )
      ],
    );
  }

  List<Widget> createAbsencesColumn(BuildContext context, Map<String, List<Absence>> absences){
    final List<Widget> columns = <Widget>[];
    columns.add(absencePageTitle());

    for (var key in absences.keys){
      columns.add(absenceWidget(key, absences[key]));
    }
    return columns;
  }

  Widget absencePageTitle(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text('Faltas',
          style: TextStyle( fontSize: 40)),
    );
  }

  Color getAbsenceColor(int value){
    if(value >= 4){
      return Colors.grey;
    }
    else if(value == 3){
      return Colors.redAccent;
    }
    else if(value == 2){
      return Colors.amber;
    }
    else if(value == 1){
      return Colors.green;
    }
    return Colors.white;
  }

  Widget absenceWidget(String key, List<Absence> value){
    return Padding(
      key: Key('Absence_' + key),
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AbsencesDayPageView(course: key, absences: value)));
          },
        child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
              color: getAbsenceColor(value.length),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(key,
                        style: TextStyle(color:Colors.black, fontSize: 25)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(value.length.toString(),
                        style: TextStyle(color:Colors.black, fontSize: 30)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

