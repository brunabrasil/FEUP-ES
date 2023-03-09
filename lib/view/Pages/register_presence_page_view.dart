
import 'package:flutter/material.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../model/request_page_model.dart';
import 'general_page_view.dart';
import 'register_by_name_page_view.dart';
import 'request_page_view.dart';
import '../theme.dart';

class RegisterPresencePageView extends StatefulWidget{
  final StudentNames studentNames;

  RegisterPresencePageView(
      {Key key, @required this.studentNames});

  @override
  State<StatefulWidget> createState() => RegisterPresencePageViewState(
      studentNames : studentNames);

}

class RegisterPresencePageViewState extends GeneralPageViewState{

  RegisterPresencePageViewState(
      {Key key,@required this.studentNames});

  final StudentNames studentNames;

  @override
  Widget getBody(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text('Registar presenças', style: TextStyle(color: Color.fromARGB(255, 0x75, 0x17, 0x1e), fontSize: 25)),
            SizedBox(height: 30),
            ElevatedButton.icon(
              /*onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },*/
                icon: Icon(Icons.add, size: 30),
                label: Text('Ler QR code')
            ),
            SizedBox(height: 35),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RequestPageView(),
                  ));
                },
                icon: Icon(Icons.add, size: 30),

                label: Text('Pedidos de presença'),
                key: Key('buttonRequests')
            ),
            SizedBox(height: 35),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterByNamePageView(studentNames: studentNames),
                  ));
                },
                icon: Icon(Icons.add, size: 30),
                label: Text('Marcar presença por nome'),
                key: Key('presenceName')
            )
          ],
        )
    );
  }
}

class RequestPageView extends StatefulWidget{
  RequestPageView(
      {Key key});

  @override
  State<StatefulWidget> createState() => RequestPageViewState();
}

class RequestPageViewState extends GeneralPageViewState {
  RequestPageViewState({Key key});

  RequestController req = RequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos de presença'),
        backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: this.createRequestsColumn(context, req.getRequests()),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createRequestsColumn(BuildContext context, List<Request> req){
    final List<Widget> columns = <Widget>[];

    for(Request value in req){
      if(!value.accepted || value.show){
        columns.add(requestWidget(value));
      }
    }
    return columns;
  }

  void _acceptRequestTest(Request value) {
    setState(() => req.acceptRequest(value.name));
  }
  void _rejectRequestTest(Request value) {
    setState(() => req.rejectRequest(value.name));
  }

  Widget requestWidget(Request value){
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(value.name,
                    style: TextStyle(color:Colors.black, fontSize: 15)),
                Text(value.day,
                    style: TextStyle(color:Colors.black, fontSize: 20))

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Icon(Icons.check, size: 10.0,color: Colors.white),
                  onPressed: (){_acceptRequestTest(value);},
                  key: Key('acceptButton'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(7,11),
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),

                      )),
                ),
                TextButton(
                  child: Icon(Icons.close, size: 10.0,color: Colors.white),
                  onPressed: (){_rejectRequestTest(value);},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(7,13),
                      primary: Colors.red,
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

