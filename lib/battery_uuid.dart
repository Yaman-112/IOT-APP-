import 'dart:async';
import 'dart:convert' show utf8;
import'./Steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'Steps.dart';
import 'package:tynorkneecap/battery.dart';

class SensorPage_three extends StatefulWidget {


  final String text;
  const SensorPage_three({Key key, this.device,this.text}) : super(key: key);
  final BluetoothDevice device;

  @override
  _SensorPage_threeState createState() => _SensorPage_threeState();
}

class _SensorPage_threeState extends State<SensorPage_three> {


  String service_uuid_two = "d2d117ac-6420-4257-add8-b2ffac2e2c27";
  String charaCteristic_uuid_two = "9f39cef6-cb85-4437-97ed-508fae4ae6fb";

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
      if (service.uuid.toString() == service_uuid_two) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == charaCteristic_uuid_two) {
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
              //stream_one:stream_one,
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


                  return batteryPage(
                    value_one: _value_one,

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