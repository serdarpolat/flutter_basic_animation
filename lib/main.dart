import 'package:flutter/material.dart';

void main() => runApp(new AnimationDemo());

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      value: 50.0,
      lowerBound: 50.0,
      upperBound: 300.0,
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            if(_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.animateTo(300.0, curve: Curves.bounceOut);
            }
          },
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  child: child,
                  height: _controller.value,
                  width: _controller.value,
                );
              },
              child: Container(
                color: Colors.red,
                constraints: BoxConstraints.expand(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
