import 'package:flutter/material.dart';
import 'package:swipe_counter/bloc/bloc_provider.dart';
import 'package:swipe_counter/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: counterBloc,
      child: Scaffold(
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
              child: StreamBuilder<int>(
                stream: counterBloc.counterStream,
                builder: (context, snapshot) {
                  return Dismissible(
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      height: 200.0,
                      width: 200.0,
                      child: Center(
                        child: Text(
                          counterBloc.currentCount.toString(),
                          style: TextStyle(
                            fontSize: 50.0
                          ),
                        ),
                      ),
                    ), 
                    key: ValueKey(counterBloc.currentCount),
                    onDismissed: (direction) {
                      direction == DismissDirection.startToEnd 
                        ? counterBloc.incrementCount()
                        : counterBloc.decrementCount();
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}