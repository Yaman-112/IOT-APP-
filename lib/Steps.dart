
import 'Steps_UUID.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class stepPage extends StatefulWidget {
  final double value_one;
  final double value_two;
  final double value_three;
  final double value_four;
  final double value_five;

  const stepPage({Key key,this.value_one,this.value_two,this.value_three, this.value_four, this.value_five}) : super(key: key);


  @override
  _stepPageState createState() => _stepPageState();
}

class _stepPageState extends State<stepPage> {

  String value_two_act;


  @override

   activity(){
    if(widget.value_two == 0.00){
      value_two_act = "STANDING";}

    if(widget.value_two == 1.00){
      value_two_act = "SITTING";}

    if(widget.value_two == 2.00){
      value_two_act = "WALKING";}

    if(widget.value_two == 3.00){
    value_two_act = "STAIRS";}
//
//    else{
//      value_two_act = "...";}
    return value_two_act;
  }




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
          FlatButton(
            onPressed: () {},
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 50,
                  child: Icon(
                    Icons.battery_full,
                    color: Theme.of(context).accentColor,
                    size: 35,
                  ),
                ),

              ],
            ),
          )
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
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor.withAlpha(50),
                  ),
                  child: Image.asset(
                    'assets/img/shoe.png',
                    width: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Text(
                  '${widget.value_one}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 80,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[


                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text(
                        'Steps Taken'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Bebas',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
//                      Text(
//                        'You walked 165 min today',
//                        style: TextStyle(
//                          color: Theme.of(context).accentColor,
//                          fontSize: 16,
//                        ),
//                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
//                Container(
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        flex: 3,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Text(
//                              'DISTANCE',
//                              style: TextStyle(
//                                color: Theme.of(context).primaryColor,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                            RichText(
//                              text: TextSpan(
//                                children: [
//                                  TextSpan(
//                                    text: '8500',
//                                    style: TextStyle(
//                                      fontSize: 20,
//                                      color: Theme.of(context).accentColor,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                  TextSpan(
//                                    text: ' m',
//                                    style: TextStyle(
//                                      color: Colors.grey,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Expanded(
//                        flex: 3,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Text(
//                              'CALORIES',
//                              style: TextStyle(
//                                color: Theme.of(context).primaryColor,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                            RichText(
//                              text: TextSpan(
//                                children: [
//                                  TextSpan(
//                                    text: '259',
//                                    style: TextStyle(
//                                      fontSize: 20,
//                                      color: Theme.of(context).accentColor,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                  TextSpan(
//                                    text: ' cal',
//                                    style: TextStyle(
//                                      color: Colors.grey,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Expanded(
//                        flex: 3,
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.end,
//                          children: <Widget>[
//                            Text(
//                              'HEART RATE',
//                              style: TextStyle(
//                                color: Theme.of(context).primaryColor,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                            RichText(
//                              text: TextSpan(
//                                children: [
//                                  TextSpan(
//                                    text: '102',
//                                    style: TextStyle(
//                                      fontSize: 20,
//                                      color: Theme.of(context).accentColor,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                  TextSpan(
//                                    text: ' bpm',
//                                    style: TextStyle(
//                                      color: Colors.grey,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                      'Activity Classifiaction',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24,
                        fontFamily: 'Bebas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Text(
                      activity(),
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
//                Container(
//                  height: 250,
//                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
//                  child: ListView(
//                    physics: ClampingScrollPhysics(),
//                    shrinkWrap: true,
//                    scrollDirection: Axis.horizontal,
//                    children: <Widget>[
//                      StatCard(
//                        title: 'ONE',
//                        achieved: 0,
//                        total: 0,
//                        color: Colors.orange,
//                        image: Image.asset('assets/img/bolt.png', width: 20),
//                      ),
//                      StatCard(
//                        title: 'TWO',
//                        achieved: 0,
//                        total: 0,
//                        color: Theme.of(context).primaryColor,
//                        image: Image.asset('assets/img/bolt.png', width: 20),
//                      ),
//                      StatCard(
//                        title: 'THREE',
//                        achieved:0,
//                        total: 0,
//                        color: Colors.green,
//                        image: Image.asset('assets/img/bolt.png', width: 20),
//                      ),
//                    ],
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.image,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).accentColor.withAlpha(100),
                  fontSize: 14,
                ),
              ),
              achieved < total
                  ? Image.asset(
                'assets/img/down_orange.png',
                width: 20,
              )
                  : Image.asset(
                'assets/img/up_red.png',
                width: 20,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: achieved / (total < achieved ? achieved : total),
            circularStrokeCap: CircularStrokeCap.round,
            center: image,
            progressColor: color,
            backgroundColor: Theme.of(context).accentColor.withAlpha(30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
              TextSpan(
                text: ' / $total',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}


