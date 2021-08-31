import 'package:flutter/material.dart';
import 'package:tynorkneecap/TempWidget.dart';



class TempPage extends StatefulWidget {
  final double value_one;


  const TempPage({Key key,this.value_one}) : super(key: key);


  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFCADCED),
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor:Color(0xFFCADCED),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 10),

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


              ],
            ),
          ],
        ),
        actions: <Widget>[

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[




                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[


                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text(
                        'Temperature'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Bebas',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),


                Divider(
                  height: 25,
                  color: Colors.grey[300],

                ),

                Center(
                  child: SizedBox(
                    child: ThermometerWidget(
                      borderColor: Colors.black,
                      innerColor: Colors.purple[50],
                      indicatorColor: Colors.purple,
                      temperature: widget.value_one,
                    ),
                  ),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],

                ),

                Text(
                  '${widget.value_one}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
