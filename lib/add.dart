import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddItem extends StatefulWidget {
  AddItem();

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var newname;
  var newprice;

  final _auth = FirebaseAuth.instance;
  late User loggedin;
  var emid = '';

  @override
  void initState() {
    super.initState();
    currentuser();
  }

  void currentuser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedin = user;
      setState(() {
        emid = user.email!;
      });
    }
  }

  void save() {
    FirebaseFirestore.instance.collection('items').add({
      "name": newname,
      "price": newprice,
      "dtime":
          "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}",
      "email": emid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Add Item',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Item Name',
            ),
            onChanged: (newtext) {
              newname = newtext;
            },
          ),
          SizedBox(
            height: 25.0,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Item Price',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (newnum) {
              newprice = double.parse(newnum);
            },
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
                    if (newname != null && newprice != null) {
                      Navigator.pop(context);
                      save();
                    } else {
                      var alert = AlertDialog(
                        title: Text('Insufficient Data'),
                        content: Text(
                            "One or both of the above fields are empty.\nPlease fill all the fields."),
                        actions: [
                          MaterialButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  },
                  child: Text(
                    'Add Item',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            // Material(
            //   color: Colors.blueGrey,
            //   borderRadius: BorderRadius.circular(20.0),
            //   child: MaterialButton(
            //     onPressed: () async {
            //       if (newname != null && newprice != null) {
            //         Navigator.pop(context);
            //         save();
            //       } else {
            //         var alert = AlertDialog(
            //           title: Text('Insufficient Data'),
            //           content: Text(
            //               "One or both of the above fields are empty.\nPlease fill all the fields."),
            //           actions: [
            //             MaterialButton(
            //               child: Text("OK"),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             )
            //           ],
            //         );
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return alert;
            //           },
            //         );
            //       }
            //     },
            //     minWidth: 200.0,
            //     height: 42.0,
            //     child: Text(
            //       'Add Item',
            //       style: TextStyle(
            //         fontSize: 30.0,
            //         color: Colors.white70,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
