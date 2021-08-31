import 'package:flutter/material.dart';
import 'package:tynorkneecap/size.dart';
class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width / 30),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            child: Text(
              "Tynor App",
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 40,
              fontFamily: 'AfternooninStereo',
                shadows: [
                Shadow(
                blurRadius: 10.0,
                color: Colors.black12,
                offset: Offset(5.0, 5.0),
              ),
        ]
        ),
//
            )),
      ),
    );
  }
}