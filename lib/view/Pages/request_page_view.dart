import 'package:flutter/material.dart';
import '../../model/request_page_model.dart';
import 'general_page_view.dart';

class RequestPageView extends StatefulWidget{
  final Map<String, List<Request>> requests;
  RequestPageView(
      {Key key,
        @required this.requests});

  @override
  State<StatefulWidget> createState() => RequestPageViewState(requests: requests);
}

class RequestPageViewState extends GeneralPageViewState {
  RequestPageViewState({Key key,
    @required this.requests});

  final Map<String, List<Request>> requests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        backgroundColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: this.createRequestsColumn(context, requests),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createRequestsColumn(BuildContext context, Map<String, List<Request>> requests){
    final List<Widget> columns = <Widget>[];

    for (var key in requests.keys){ //will not use this for
      for(Request value in requests[key]){
        if(value.show){
          columns.add(requestWidget(key, value));
        }
      }
    }
    return columns;
  }

  Widget requestWidget(String key, Request value){
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
                  onPressed: () {
                    setState(() {
                      value.accepted = true;
                    });
                    value.show = false;
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(7,11),
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),

                      )),
                ),
                TextButton(
                  child: Icon(Icons.close, size: 13.0,color: Colors.white),
                  onPressed: () {
                    setState(() {
                      value.accepted = false;
                    });
                    value.show = false;
                  },
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