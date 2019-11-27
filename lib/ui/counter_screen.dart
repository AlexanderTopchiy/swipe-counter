import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Color.fromRGBO(0, 137, 123, 1)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Text(
                'Swipe Counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 100.0),
              child: ButtonTheme(
                height: 40.0,
                minWidth: 150.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: RaisedButton(
                  color: Color.fromRGBO(239, 83, 80, 1),
                  child: Text(
                    'Reset', 
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                      ),
                    ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}