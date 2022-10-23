import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'listscreen.dart';

class Register extends StatefulWidget {
  static const String id = 'registerscreen';
  @override
  Registerscreen createState() => Registerscreen();
}

class Registerscreen extends State<Register> {
  late String email;
  late String password;

  final _register = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'), fit: BoxFit.cover),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Hero(
                  tag: 'logo',
                  child: Center(
                      child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 250.0,
                  )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey,
                    filled: true,
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey,
                    filled: true,
                    hintText: 'Enter the password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.lightBlueAccent,
                      onPressed: () async {
                        try {
                          final newuser =
                              await _register.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newuser != null) {
                            Navigator.pushNamed(context, Listscreen.id);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Material(
                  //   color: Colors.lightBlueAccent,
                  //   borderRadius: BorderRadius.circular(20.0),
                  //   child: MaterialButton(
                  //     onPressed: () async {
                  //       try {
                  //         final newuser =
                  //             await _register.createUserWithEmailAndPassword(
                  //                 email: email, password: password);
                  //         if (newuser != null) {
                  //           Navigator.pushNamed(context, Listscreen.id);
                  //         }
                  //       } catch (e) {
                  //         print(e);
                  //       }
                  //     },
                  //     minWidth: 200.0,
                  //     height: 42.0,
                  //     child: Text(
                  //       'Submit',
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
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ]);
  }
}
