import 'dart:async';
import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'IMU_Page.dart';

class SensorPage extends StatefulWidget {


  final String text;
  const SensorPage({Key key, this.device,this.text}) : super(key: key);
  final BluetoothDevice device;

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {


  String service_uuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String charaCteristic_uuid = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  bool isReady;

  Stream<List<int>> stream;

  //++++++++++++Values param++++++++++++++//

  List _Values;
  double _value_one = 0;
  double _value_two = 0;
  double _value_three = 0;
  double _value_four = 0;
  double _value_five = 0;

  //++++++++++++++++++++++++++++++++++++++//

  @override
  void initState() {
    super.initState();
    isReady = false;
    connectToDevice();
  }

  void dispose() {
    widget.device.disconnect();
    super.dispose();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _pop();
      }
    });

    await widget.device.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == service_uuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == charaCteristic_uuid) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;
            setState(() {
              isReady = true;
            });
          }

          }
        );
      }


    });
    if (!isReady) {
      _pop();
    }

  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to go back?'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No')),
            new FlatButton(
                onPressed: () {
                  disconnectFromDevice();
                  Navigator.of(context).pop(true);
                },
                child: new Text('Yes')),
          ],
        ) ??
            false);
  }

  _pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(

        body: Container(
            child: !isReady
                ? Center(
              child: Text(
                "Waiting...",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            )
                : Container(
              child: StreamBuilder<List<int>>(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<int>> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  if (snapshot.connectionState ==
                      ConnectionState.active) {
                    // geting data from bluetooth
                    var currentValue = _dataParser(snapshot.data);
                    _Values = currentValue.split(",");
                    if (_Values[0] != "nan") {
                      _value_one = double.parse('${_Values[0]}');
                    }
                    if (_Values[1] != "nan") {
                      _value_two = double.parse('${_Values[1]}');
                    }

                    if (_Values[2] != "nan") {
                      _value_three = double.parse('${_Values[2]}');
                    }

                    if (_Values[3] != "nan") {
                      _value_four = double.parse('${_Values[3]}');
                    }

                    if (_Values[0] != "nan") {
                      _value_five = double.parse('${_Values[0]}');
                    }

                    return HomeUI(
                      value_one: _value_one,
                      value_two: _value_two,
                      value_three: _value_three,
                      value_four: _value_four,
                      value_five: _value_five,

                    );


                  } else {
                    return Text('Check the stream');
                  }
                },

              ),


            ),




        ),

      ),
    );



  }
}
