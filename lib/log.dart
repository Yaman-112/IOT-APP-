import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


void main(){
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  final double temperature;
  final double humidity;
  final double sensor;
  final String sensor1;
  final double text2;
  const MyApp({Key key, this.temperature, this.humidity, this.sensor,this.sensor1,this.text2,}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  //String data;
   List<String> data;
   List<String> stream;

   Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }


    // ignore: non_constant_identifier_names


   Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/append_TWO.txt');
  }

   Future<String> readContent() async {
     try {
       final file = await _localFile;
       // Read the file
       String contents = await file.readAsString();
       // Returning the contents of the file
       return contents;
     } catch (e) {
       // If encountering an error, return
       return 'Error!';
     }
   }



  Future<File> writeContent() async {
  final file = await _localFile;
  // Write the file
      return file.writeAsString('${widget.sensor1}',mode: FileMode.append);
   }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent().then((String value) {
      setState(() {
        data = value as List<String>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing data')),
      body: Center(
        child: RaisedButton(
          onPressed: () => writeContent(),
        ),
//        child: Text(
//          'Data read from a file: \n $data',
//        ),
      ),
    );
  }
}
