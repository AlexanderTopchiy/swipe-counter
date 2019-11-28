import 'package:flutter/material.dart';
import 'package:swipe_counter/bloc/bloc_provider.dart';
import 'package:swipe_counter/bloc/counter_bloc.dart';
import 'package:swipe_counter/resources/res_colors.dart';
import 'package:swipe_counter/resources/res_strings.dart';
import 'package:swipe_counter/resources/res_styles.dart';

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
            Container(color: ResColors.backgroundColor),
            // Title
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 100.0),
                child: Text(
                  ResStrings.pageTitle,
                  style: ResStyles.pageTitleTextStyle,
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
                    color: ResColors.resetButtonColor,
                    child: Text(
                      ResStrings.resetButton, 
                      style: ResStyles.buttonTextStyle,
                      ),
                    onPressed: () {counterBloc.resetCount();},
                  ),
                ),
              ),
            ),
            // Decrement counter direction
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: ResColors.directionMarkerColor,
                ),
                height: 30.0,
                width: 30.0,
                margin: EdgeInsets.only(left: 10.0),
                child: Center(
                  child: Text(
                    ResStrings.minus, 
                    style: ResStyles.buttonTextStyle,
                  ),
                ),
              ),
            ),
            // Increment counter direction
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: ResColors.directionMarkerColor,
                ),
                height: 30.0,
                width: 30.0,
                margin: EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Text(
                    ResStrings.plus, 
                    style: ResStyles.buttonTextStyle,
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
                          style: ResStyles.cardTextStyle,
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