import 'package:flutter/material.dart';
import 'package:gdsc/auth.dart';


class Home extends StatefulWidget {
  static const String id = 'homescreen';
  @override
  Homescreen createState() => Homescreen();
}

class Homescreen extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/home.jpg'), fit: BoxFit.cover),
    ),
        ),
        Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'SHOPIST',
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w800),
                  ),
                  Hero(tag: 'logo',
                  child: Center(
                    child: Image(image: AssetImage('assets/images/logo.png'), height: 100.0,)))
                  
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Auth.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),]
    );
  }
}
