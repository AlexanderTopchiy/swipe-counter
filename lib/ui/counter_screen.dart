import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background
          Container(color: Color.fromRGBO(0, 137, 123, 1)),
          // Title
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
          // Reset button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80.0),
              child: ButtonTheme(
                height: 42.0,
                minWidth: 140.0,
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
          // Decrement counter direction
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
              height: 30.0,
              width: 30.0,
              margin: EdgeInsets.only(left: 10.0),
              child: Center(
                child: Text(
                  '-', 
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    ),
                ),
              ),
            ),
          ),
          // Increment counter direction
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
              height: 30.0,
              width: 30.0,
              margin: EdgeInsets.only(right: 10.0),
              child: Center(
                child: Text(
                  '+', 
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    ),
                ),
              ),
            ),
          ),
          // Counter card
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: 200.0,
              width: 200.0,
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 50.0
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}