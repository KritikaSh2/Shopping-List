import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth.dart';

class OnBoarding3 extends StatefulWidget {
  static const String id = 'onboarding3';

  const OnBoarding3({Key? key}) : super(key: key);

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Lottie.asset("assets/jsonfiles/save.json"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Save and Secure',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'All your Data will be save and secure. It will save all you previous and current shopping list with specific date and time. You can delete them.',
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

          //***************Button*******************//
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Auth.id);
            },
            child: Container(
              height: 50,
              width: 200,
              padding: const EdgeInsets.only(left: 45),
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
                  "Get Started",
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
