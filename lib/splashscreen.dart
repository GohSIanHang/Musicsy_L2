import 'package:flutter/material.dart';
import 'package:lab2/loginscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musicsy',
      home: Scaffold(
          body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.jpg'),
                  fit: BoxFit.cover),
            )),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/images/logo.png",
                  height: 230.0, fit: BoxFit.cover),
              SizedBox(
                height: 50,
              ),
              ProgressIndicator(),
            ])
          ],
        ),
      )),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  @override
  ProgressIndicatorState createState() => new ProgressIndicatorState();
}

class ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          //updating states
          if (animation.value > 0.99) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Loginscreen()));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      width: 200,
      color: Colors.redAccent,
      child: LinearProgressIndicator(
        value: animation.value,
        backgroundColor: Colors.yellow[900],
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    ));
  }
}
