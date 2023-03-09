import 'package:flutter/material.dart';
import 'package:uni/view/Pages/register_presence_page_view.dart';

class Request{
  String name;
  String subject;
  String day;
  bool accepted;
  bool show;
  Request(this.name, this.subject, this.day, this.accepted, this.show);
}

class RequestController {
  static final RequestController _instance = RequestController._internal();

  factory RequestController() {
    return _instance;
  }

  RequestController._internal();

  List<Request> requests = [];

  List<Request> getRequests() {
    return this.requests;
  }
  void insert(Request r){
    requests.add(r);
  }
  void acceptRequest(String name){
    for(Request r in requests){
      if(r.name==name && !r.accepted){
        r.accepted=true;
        r.show=false;
        return;
      }
    }
  }
  void rejectRequest(String name){
    for(Request r in requests){
      if(r.name==name && !r.accepted){
        r.show=false;
        return;
      }
    }
  }
}

class StudentPresence {
  String name;
  bool present;
  StudentPresence(this.name, this.present);
}
class StudentNames{
  String subject;
  String weekDay;
  String time;
  String day;
  List<StudentPresence> students;
  StudentNames(this.subject, this.weekDay, this.time, this.day, this.students);
}

class RequestPage extends StatefulWidget {
  //Handle arguments from parent
  const RequestPage({Key key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  StudentNames names;

  void updateInfo() {
      List<StudentPresence> students = [];
      students.add(StudentPresence('Bruna Brasil Leão Marques',false));
      students.add(StudentPresence('Dinis Ribeiro dos Santos Bessa de Sousa',false));
      students.add(StudentPresence('Francisca Oliveira e Silva',false));
      students.add(StudentPresence('João António Maricato Malva',false));
      names = StudentNames('DA', 'Sexta-feira', '14:00', '03/06/2022', students);
  }

  @override
  Widget build(BuildContext context) {
    updateInfo();
    return RegisterPresencePageView(studentNames: names);
  }

}