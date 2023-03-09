import 'package:flutter/material.dart';
import 'package:uni/view/Pages/absences_page_view.dart';


class Absence{
  String subject;
  String weekDay;
  String time;
  String day;
  Absence(this.subject, this.weekDay, this.time, this.day);
}

class AbsencePage extends StatefulWidget {
  //Handle arguments from parent
  const AbsencePage({Key key}) : super(key: key);

  @override
  _AbsencePageState createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  Map<String, List<Absence>> absences;

  @override
  void initState() {
    super.initState();
    absences = Map();
  }

  @override
  Widget build(BuildContext context) {
    updateInfo();
    return AbsencesPageView(
        absences: absences);
  }

  void updateInfo() async {
    setState(() {
      List<Absence> da = [];
      da.add(Absence('DA', 'Sexta-feira', '14:00', '03/06/2022'));
      da.add(Absence('DA', 'Sexta-feira', '14:00', '27/05/2022'));
      da.add(Absence('DA', 'Sexta-feira', '14:00', '20/05/2022'));
      da.add(Absence('DA', 'Sexta-feira', '14:00', '13/05/2022'));
      absences['DA'] = da;

      List<Absence> lc = [];
      lc.add(Absence('LC', 'Sexta-feira', '16:00', '03/06/2022'));
      lc.add(Absence('LC', 'Sexta-feira', '16:00', '27/05/2022'));
      lc.add(Absence('LC', 'Sexta-feira', '16:00', '20/05/2022'));
      absences['LC'] = lc;

      List<Absence> ltw = [];
      ltw.add(Absence('LTW', 'Terça-feira', '14:00', '31/05/2022'));
      ltw.add(Absence('LTW', 'Terça-feira', '14:00', '24/05/2022'));
      absences['LTW'] = ltw;

      List<Absence> so = [];
      so.add(Absence('SO', 'Terça-feira', '20:00', '31/05/2022'));
      absences['SO'] = so;

      absences['ES'] = [];
    });
  }
}