import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tynorkneecap/appbar.dart';
import 'package:path_provider/path_provider.dart';
import 'log.dart';



class HomeUI extends StatefulWidget {
  final double value_one;
  final double value_two;
  final double value_three;
  final double value_four;
  final double value_five;
  const HomeUI({Key key, this.value_one, this.value_two, this.value_three,this.value_five,this.value_four}) : super(key: key);
  @override
  _HomeUIState createState() => _HomeUIState();
}
class _HomeUIState extends State<HomeUI> {
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
    return File('$path/app.txt');
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
  for(int a=0; a <= 10; a++) {
  final file = await _localFile;
  // Write the file
  return file.writeAsString('${widget.value_two},', mode: FileMode.append);
  }
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
      backgroundColor: Color(0xFFCADCED),

      body:

      Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),



            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                child:  CustomAppBar(),
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
                child: Column(
                  children: [
//                    SizedBox(
//                      height: 50,
//                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SleekCircularSlider(
                            appearance: CircularSliderAppearance(
                                customWidths: CustomSliderWidths(
                                    trackWidth: 2,
                                    progressBarWidth: 1,
                                    shadowWidth: 0),
//                          customColors: CustomSliderColors(
//                              trackColor: HexColor('#0277bd'),
//                              progressBarColor: HexColor('#4FC3F7'),
//                              shadowColor: HexColor('#B2EBF2'),
//                              shadowMaxOpacity: 0.5, //);
//                              shadowStep: 20),
                                infoProperties: InfoProperties(
//                              bottomLabelStyle: TextStyle(
//                                  color: HexColor('#6DA100'),
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w600),
//                                 bottomLabelText: 'Angle Pitch',
//                              mainLabelStyle: TextStyle(
//                                  color: HexColor('#54826D'),
//                                  fontSize: 30.0,
//                                  fontWeight: FontWeight.w600),
                                    modifier: (double value) {
                                      return '${widget.value_one - widget.value_three} ˚';
                                    }),
                                //startAngle: 90,
                                //angleRange: 360,
//                          size: 200.0,
                                animationEnabled: true),
                            min: -9999,
                            max: 9999,
                            initialValue: widget.value_one,
                          ),
                          Text('Roll 1 - Roll 2'),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 21),
                          child:

                          Column(
                            children: [
                              SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                        trackWidth: 2,
                                        progressBarWidth: 0,
                                        shadowWidth: 0),
//                          customColors: CustomSliderColors(
//                              trackColor: HexColor('#ef6c00'),
//                              progressBarColor: HexColor('#ffb74d'),
//                              shadowColor: HexColor('#ffb74d'),
//                              shadowMaxOpacity: 0.5, //);
//                              shadowStep: 20),
                                    infoProperties: InfoProperties(
//                              bottomLabelStyle: TextStyle(
//                                  color: HexColor('#6DA100'),
//                                  fontSize: 15,
//                                  fontWeight: FontWeight.w600),
//                                   bottomLabelText: 'Angle Roll',
//                              mainLabelStyle: TextStyle(
//                                  color: HexColor('#54826D'),
//                                  fontSize: 30.0,
//                                  fontWeight: FontWeight.w600),
                                        modifier: (double value) {
                                          return '${widget.value_one} ˚';
                                        }),
                                    //startAngle: 90,
//                          angleRange: 360,
                                    //size: 200.0,
                                    animationEnabled: true),
                                min: -9999,
                                max: 9999,
                                initialValue: widget.value_one,
                              ),

                              Text(
                                'Angle Roll 1'
                              ),
                            ],
                          ),
                        ),


//                    SizedBox(
//                      height: 50,
//                    ),
                    Column(
                      children: [
                        SleekCircularSlider(
                         appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(
                                  trackWidth: 2,
                                  progressBarWidth: 1,
                                 shadowWidth: 0),
//                          customColors: CustomSliderColors(
//                              trackColor: HexColor('#0277bd'),
//                              progressBarColor: HexColor('#4FC3F7'),
//                              shadowColor: HexColor('#B2EBF2'),
//                              shadowMaxOpacity: 0.5, //);
//                              shadowStep: 20),
                              infoProperties: InfoProperties(
//                              bottomLabelStyle: TextStyle(
//                                  color: HexColor('#6DA100'),
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w600),
//                                 bottomLabelText: 'Angle Pitch',
//                              mainLabelStyle: TextStyle(
//                                  color: HexColor('#54826D'),
//                                  fontSize: 30.0,
//                                  fontWeight: FontWeight.w600),
                                  modifier: (double value) {
                                    return '${widget.value_two} ˚';
                                  }),
                              //startAngle: 90,
                              //angleRange: 360,
//                          size: 200.0,
                              animationEnabled: true),
                          min: -9999,
                          max: 9999,
                          initialValue: widget.value_two,
                        ),
                        Text('Angle Pitch 1'),
                      ],
                    ),
//                    SizedBox(
//                      height: 30,
//),
      ],
      ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            children: [
                              SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                        trackWidth: 2,
                                        progressBarWidth: 1,
                                        shadowWidth: 0),
//                          customColors: CustomSliderColors(
//                              trackColor: HexColor('#0277bd'),
//                              progressBarColor: HexColor('#4FC3F7'),
//                              shadowColor: HexColor('#B2EBF2'),
//                              shadowMaxOpacity: 0.5, //);
//                              shadowStep: 20),
                                    infoProperties: InfoProperties(
//                              bottomLabelStyle: TextStyle(
//                                  color: HexColor('#6DA100'),
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w600),
//                                 bottomLabelText: 'Angle Pitch',
//                              mainLabelStyle: TextStyle(
//                                  color: HexColor('#54826D'),
//                                  fontSize: 30.0,
//                                  fontWeight: FontWeight.w600),
                                        modifier: (double value) {
                                          return '${widget.value_three} ˚';
                                        }),
                                    //startAngle: 90,
                                    //angleRange: 360,
//                          size: 200.0,
                                    animationEnabled: true),
                                min: -9999,
                                max: 9999,
                                initialValue: widget.value_three,
                              ),
                              Text('Angle Roll 2'),
                            ],
                          ),
                        ),

                        Column(
                      children: [
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(
                                  trackWidth: 2,
                                  progressBarWidth: 1,
                                  shadowWidth: 0),
//                          customColors: CustomSliderColors(
//                              trackColor: HexColor('#0277bd'),
//                              progressBarColor: HexColor('#4FC3F7'),
//                              shadowColor: HexColor('#B2EBF2'),
//                              shadowMaxOpacity: 0.5, //);
//                              shadowStep: 20),
                              infoProperties: InfoProperties(
//                              bottomLabelStyle: TextStyle(
//                                  color: HexColor('#6DA100'),
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w600),
//                                 bottomLabelText: 'Angle Pitch',
//                              mainLabelStyle: TextStyle(
//                                  color: HexColor('#54826D'),
//                                  fontSize: 30.0,
//                                  fontWeight: FontWeight.w600),
                                  modifier: (double value) {
                                    return '${widget.value_four} ˚';
                                  }),
                              //startAngle: 90,
                              //angleRange: 360,
//                          size: 200.0,
                              animationEnabled: true),
                          min: -9999,
                          max: 99999,
                          initialValue: widget.value_four,
                        ),
                        Text('Angle Pitch 2'),
                      ],
                    ),
    ],
                    ),








                  ],

                ),
              ),
//
//            Expanded(
//              child: CardWidget(),
//            ),


            Row(
              children: [
//                SizedBox(
//                  width: 150,
//                  height: 50,
//                  child: RaisedButton(
//
//                    padding: EdgeInsets.all(10),
//                     onPressed:(){
//                      // For your reference print the AppDoc directory
//
//                      Navigator.push(context,
//                      MaterialPageRoute(builder: (context)=>HomePage(text: '${widget.temperature}',)),
//                      );
//                    },
//                    color: Colors.deepPurple,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                    ),
//                    child: Text(
//                      "Steps",
//                          style: TextStyle(color: Color(0xFFCADCED)),
//                    ),
//                  ),
//                ),
//


                SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    onPressed:()=>writeContent(),
                        //Navigator.push(context,
                          //MaterialPageRoute(builder: (context) =>
                            //  MyApp(sensor1: '${widget.value_one}',)),
                      //  );
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Text(
                      "Log",
                      style: TextStyle(color: Color(0xFFCADCED)),
                    ),
                  ),
                )

              ],
            ),



          ],
        ),
      ),
    );
  }



}











class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
