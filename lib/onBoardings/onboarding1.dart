import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'onboarding2.dart';

class OnBoarding1 extends StatefulWidget {
  static const String id = 'onboarding1';

  const OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("assets/jsonfiles/shoppingbag.json"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Easy Shopping',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Make your shopping easy with SHOPIFY APP',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          const SizedBox(
            height: 100,
          ),

          //***************Button*******************//
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OnBoarding2.id);
            },
            child: Container(
              height: 50,
              width: 100,
              padding: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(children: const [
                Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.black,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
