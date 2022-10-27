import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'add.dart';
import 'item.dart';
import 'auth.dart';
import 'register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Listscreen extends StatefulWidget {
  static const String id = 'listscreen';
  @override
  Liststate createState() => Liststate();
}

class Liststate extends State<Listscreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedin;
  var name = '';

  @override
  void initState() {
    super.initState();
    currentuser();
  }

  void currentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedin = user;

        setState(() {
          name = user.email!;
        });
        //name = user.email!;
        //print(loggedin.email);
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/list.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: name == ''
                ? Text('Your List\n(Swipe left/right to delete)')
                : Text(
                    "${name}'s List\n(Swipe left/right to delete)",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
            backgroundColor: Colors.lightBlueAccent,
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          backgroundColor: Colors.white70,
          body: Container(
              padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('items').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }

                  final list = snapshot.data!.docs;
                  for (var item in list) {
                    if ((item.data() as dynamic)['email'] == name) {
                      final itemname = (item.data() as dynamic)['name'];
                      final itemprice = (item.data() as dynamic)['price'];
                      final time = (item.data() as dynamic)['dtime'];

                      items.add(Item(
                          name: itemname,
                          price: itemprice,
                          time: time.toString()));
                    }

                    for (var i = 0; i < items.length; i++) {
                      for (var j = 0; j < items.length; j++) {
                        if (items[i].time == items[j].time && i != j) {
                          items.removeAt(j);
                        }
                      }
                    }
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage('assets/images/list.jpg'),
                            //     fit: BoxFit.cover),
                            // color: Colors.transparent,
                            // border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            )),
                        child: ListS(items),
                      )),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.lightBlueAccent,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => AddItem(),
                                    isScrollControlled: true);
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
                          //   color: Colors.lightBlueAccent,
                          //   borderRadius: BorderRadius.circular(20.0),
                          //   child: MaterialButton(
                          //     onPressed: () {
                          //       showModalBottomSheet(
                          //           context: context,
                          //           builder: (context) => AddItem(),
                          //           isScrollControlled: true);
                          //     },
                          //     minWidth: 200.0,
                          //     height: 42.0,
                          //     child: Text(
                          //       'Add Items',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 30.0,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          ),
                    ],
                  );
                },
              )),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ]),
    );
  }
}

class ListS extends StatefulWidget {
  final List<Item> items;
  ListS(this.items);

  @override
  State<ListS> createState() => _ListSState();
}

class _ListSState extends State<ListS> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              late String docid;
              final list = snapshot.data!.docs;
              for (var i in list) {
                if ((i.data() as dynamic)['dtime'] ==
                    widget.items[index].time) {
                  docid = i.id;
                }
              }
              final key = FirebaseFirestore.instance.collection('items').doc();
              return Dismissible(
                key: Key(key.id),
                background: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.items.removeAt(index);
                  });
                  FirebaseFirestore.instance
                      .collection('items')
                      .doc(docid)
                      .delete();
                },
                child: ListItem(
                  name: widget.items[index].name,
                  price: widget.items[index].price,
                  time: widget.items[index].time,
                  check: widget.items[index].check,
                  checkCallback: (bool? checkstate) {
                    setState(() {
                      widget.items[index].togglecheck();
                    });
                  },
                ),
              );
            },
            itemCount: widget.items.length,
          );
        });
  }
}

class ListItem extends StatelessWidget {
  final bool? check;
  final String name;
  final double price;
  final String time;
  final Function(bool?)? checkCallback;

  ListItem({
    this.check,
    required this.name,
    required this.price,
    required this.time,
    required this.checkCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name.isEmpty?name:name[0].toUpperCase() + name.substring(1),
          style: check == true
              ? TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black.withOpacity(0.4)
                )
              : TextStyle(
                  fontSize: 25,
                )),
      leading: Text(price.toString(),
          style: check == true
              ? TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black.withOpacity(0.4)
                )
              : TextStyle(
                  fontSize: 25,
                )),
      trailing: Checkbox(
        value: check,
        onChanged: checkCallback,
        activeColor: Colors.lightBlueAccent,
      ),
      subtitle: Text(
        time,
        style: check == true
              ? TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black.withOpacity(0.4)
                )
              : TextStyle(
                  fontSize: 15,
                ),),
    );
  }
}
