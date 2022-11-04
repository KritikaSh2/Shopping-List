import 'package:flutter/material.dart';
import 'package:gdsc/onBoardings/onboarding1.dart';

class Home extends StatefulWidget {
  static const String id = 'homescreen';
  @override
  Homescreen createState() => Homescreen();
}

class Homescreen extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'), fit: BoxFit.cover),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    'SHOPIFY',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.w800),
                  ),
                  Hero(
                      tag: 'logo',
                      child: Center(
                          child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 100.0,
                      )))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, OnBoarding1.id);
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                // Material(
                //   color: Colors.lightBlueAccent,
                //   borderRadius: BorderRadius.circular(20.0),
                //   child: MaterialButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, OnBoarding1.id);
                //     },
                //     minWidth: 200.0,
                //     height: 42.0,
                //     child: const Text(
                //       'Start',
                //       style: TextStyle(
                //         fontSize: 30.0,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ]);
  }
}
