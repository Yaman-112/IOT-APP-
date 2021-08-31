import 'dart:async';
import 'package:tynorkneecap/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tynorkneecap/IMU_page_UUID.dart';
import 'package:tynorkneecap/widgets.dart';

import 'Steps_UUID.dart';
import 'Temp_UUID.dart';
import 'battery_uuid.dart';

void main() {
  runApp(FlutterBlueApp());
}

class FlutterBlueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFF6D3FFF),
        accentColor: Color(0XFF233C63),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      body:


      Center(


        child: Column(


          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state.toString().substring(15)}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ],
        ),


      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFCADCED),

      body: RefreshIndicator(


        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(60),
                child: Container(
                  height: 100,
                  child:  CustomAppBar(),
                ),
              ),

              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(seconds: 2))
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map((d) => ListTile(
                            title: Text(d.name),
                            subtitle: Text(d.id.toString()),
                            trailing: StreamBuilder<BluetoothDeviceState>(
                              stream: d.state,
                              initialData: BluetoothDeviceState.disconnected,
                              builder: (c, snapshot) {
                                if (snapshot.data ==
                                    BluetoothDeviceState.connected) {}
                                return Text(snapshot.data.toString());
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              Column(
                children: [

                  Text('IMU',
                    style: TextStyle(
                      fontFamily: 'Circular',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),),
                  StreamBuilder<List<ScanResult>>(
                    stream: FlutterBlue.instance.scanResults,
                    initialData: [],
                    builder: (c, snapshot) => Column(
                      children: snapshot.data
                          .map(
                            (r) => ScanResultTile(
                              result: r,
                              onTap: () => Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                r.device.connect();
                                return SensorPage(device: r.device);
                              })),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),

              Column(

                children: [

                  Text('STEPS',
                    style: TextStyle(
                      fontFamily: 'Circular',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  StreamBuilder<List<ScanResult>>(

                    stream: FlutterBlue.instance.scanResults,
                    initialData: [],
                    builder: (c, snapshot) => Column(

                      children: snapshot.data
                          .map(
                            (r) => ScanResultTile(

                          result: r,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return SensorPage_two(device: r.device);
                          })),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Column(

                children: [

                  Text('Temperature',
                      style: TextStyle(
                        fontFamily: 'Circular',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  StreamBuilder<List<ScanResult>>(

                    stream: FlutterBlue.instance.scanResults,
                    initialData: [],
                    builder: (c, snapshot) => Column(

                      children: snapshot.data
                          .map(
                            (r) => ScanResultTile(

                          result: r,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return SensorPage_temp(device: r.device);
                          })),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Column(

                children: [

                  Text('Battery',
                    style: TextStyle(
                      fontFamily: 'Circular',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  StreamBuilder<List<ScanResult>>(

                    stream: FlutterBlue.instance.scanResults,
                    initialData: [],
                    builder: (c, snapshot) => Column(

                      children: snapshot.data
                          .map(
                            (r) => ScanResultTile(

                          result: r,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return SensorPage_three(device: r.device);
                          })),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: Duration(seconds: 4),),
              backgroundColor: Colors.black,
            );
          }
        },
      ),
    );
  }
}
