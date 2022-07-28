import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sensor.dart';
import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  IconData myFocus = Icons.lightbulb_circle_rounded;
  Color myColor = Colors.red;
  bool itsOn = false;
  String itDistance = "";
  String url = "http://bwt-api-full.somee.com/api/sensor/one/?id=1";
  String mensaje = "";

  @override
  void initState() {
    super.initState();
    _getListado();
    //getDataSensors();
  }

  void UpdateState(bool value) {
    if (!value) {
      myFocus = Icons.lightbulb_circle_outlined;
      myColor = Colors.red;
    } else {
      myFocus = Icons.lightbulb_circle_rounded;
      myColor = Colors.yellow;
    }
  }

  Future<dynamic> _getListado() async {
    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respuesta.body);
      print(data);
      itDistance = data["distance"];
    } else {
      print("Error con la respusta");
    }

    void getDataSensors() async {}

    /*if(isState.docs.length != 0){
      for(var d in isState.docs){
        itDistance = d.get('distance');
        itsOn = d.get('isState');
      }
      UpdateState(itsOn);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(itDistance.toString(),
                style: const TextStyle(fontSize: 24.0, color: Colors.black)),
            InkWell(
              child: Container(
                child: Icon(myFocus, color: myColor, size: 275.0),
              ),
            ),
            Switch(
                value: itsOn,
                onChanged: (value) {
                  setState(() {
                    itsOn = value;
                    UpdateState(itsOn);
                  });
                }),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UsersPage()));
        },
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.people_alt),
        tooltip: 'Users',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
