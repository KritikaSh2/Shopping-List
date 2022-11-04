import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'onboarding3.dart';

class OnBoarding2 extends StatefulWidget {
  static const String id = 'onboarding2';

  const OnBoarding2({Key? key}) : super(key: key);

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Lottie.asset("assets/jsonfiles/checklist.json"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Make a List',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Make a shopping List with SHOPIFY. All your items appears with name and price. You can delete them or mark as completed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 100,
          ),

          //**************Button*******************//
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OnBoarding3.id);
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
