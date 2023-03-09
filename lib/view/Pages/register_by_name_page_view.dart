import 'package:flutter/material.dart';
import '../../model/request_page_model.dart';
import 'general_page_view.dart';


class RegisterByNamePageView extends StatefulWidget{
  StudentNames studentNames;
  RegisterByNamePageView(
      {Key key,
        @required this.studentNames});

  @override
  State<StatefulWidget> createState() => RegisterByNamePageViewState(studentNames: studentNames);
}

class RegisterByNamePageViewState extends GeneralPageViewState {
  RegisterByNamePageViewState({Key key,
    @required this.studentNames});

  StudentNames studentNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
        backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: this.createNamesColumn(context, studentNames),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createNamesColumn(BuildContext context, StudentNames studentNames){
    final List<Widget> columns = <Widget>[];

    for (var student in studentNames.students){
      columns.add(nameWidget(student));
    }
    return columns;
  }

  Widget nameWidget(StudentPresence student){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 96,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            )
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(student.name,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(color:Colors.black, fontSize: 20))

              ],
            )
            )
            ,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Icon(Icons.check, size: 10.0,color: Colors.white),
                  onPressed: () {
                    setState(() {
                      student.present = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(7,11),
                      primary: student.present ? Colors.grey : Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),

                      )),
                ),
                TextButton(
                  child: Icon(Icons.close, size: 13.0,color: Colors.white),
                  onPressed: () {
                    setState(() {
                      student.present = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(7,13),
                      primary: student.present ? Colors.red : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),

                      )),
                )

              ],
            )
            /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.toString(),
                    style: TextStyle(color:Colors.black, fontSize: 30)),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}