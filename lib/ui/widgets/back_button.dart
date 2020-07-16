import 'package:flutter/material.dart';
class BackButton extends StatefulWidget {
   @override
  _BackButtonState createState() => _BackButtonState();
}
class _BackButtonState extends State<BackButton> {
  @override
Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              Text('Back',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
            ])));
  }
}
