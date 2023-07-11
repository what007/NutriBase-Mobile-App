import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/addpost.dart';
import 'package:flutter/material.dart';
import 'infopost.dart';

class posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<posts> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  // DateTime _value = DateTime.now();
  // DateTime today = DateTime.now();
  // Color _rightArrowColor = Color(0xffC1C1C1);
  // Color _leftArrowColor = Color(0xffC1C1C1);

  // Future _selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _value,
  //     firstDate: new DateTime(2019),
  //     lastDate: new DateTime.now(),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           primaryColor: const Color(0xff5FA55A), //Head background
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (picked != null) setState(() => _value = picked);
  //   _stateSetter();
  // }

  // void _stateSetter() {
  //   if (today.difference(_value).compareTo(Duration(days: 1)) == -1) {
  //     setState(() => _rightArrowColor = Color(0xffEDEDED));
  //   } else
  //     setState(() => _rightArrowColor = Colors.white);
  // }

  // Widget _showDatePicker() {
  //   return Container(
  //     width: 200,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         IconButton(
  //           key: Key("left_arrow_button"),
  //           icon: Icon(Icons.arrow_left, size: 25.0),
  //           color: _leftArrowColor,
  //           onPressed: () {
  //             setState(() {
  //               _value = _value.subtract(Duration(days: 1));
  //               _rightArrowColor = Colors.white;
  //             });
  //           },
  //         ),
  //         TextButton(
  //           onPressed: () => _selectDate(),
  //           child: Text(
  //             _dateFormatter(_value),
  //             style: TextStyle(
  //               fontFamily: 'Open Sans',
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           key: Key("right_arrow_button"),
  //           icon: Icon(Icons.arrow_right, size: 25.0),
  //           color: _rightArrowColor,
  //           onPressed: () {
  //             if (today.difference(_value).compareTo(Duration(days: 1)) == -1) {
  //               setState(() {
  //                 _rightArrowColor = Color(0xffC1C1C1);
  //               });
  //             } else {
  //               setState(() {
  //                 _value = _value.add(Duration(days: 1));
  //               });
  //               if (today.difference(_value).compareTo(Duration(days: 1)) ==
  //                   -1) {
  //                 setState(() {
  //                   _rightArrowColor = Color(0xffC1C1C1);
  //                 });
  //               }
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // String _dateFormatter(DateTime tm) {
  //   DateTime today = new DateTime.now();
  //   Duration oneDay = new Duration(days: 1);
  //   Duration twoDay = new Duration(days: 2);
  //   String month;

  //   switch (tm.month) {
  //     case 1:
  //       month = "Jan";
  //       break;
  //     case 2:
  //       month = "Feb";
  //       break;
  //     case 3:
  //       month = "Mar";
  //       break;
  //     case 4:
  //       month = "Apr";
  //       break;
  //     case 5:
  //       month = "May";
  //       break;
  //     case 6:
  //       month = "Jun";
  //       break;
  //     case 7:
  //       month = "Jul";
  //       break;
  //     case 8:
  //       month = "Aug";
  //       break;
  //     case 9:
  //       month = "Sep";
  //       break;
  //     case 10:
  //       month = "Oct";
  //       break;
  //     case 11:
  //       month = "Nov";
  //       break;
  //     case 12:
  //       month = "Dec";
  //       break;
  //     default:
  //       month = "Undefined";
  //       break;
  //   }

  //   Duration difference = today.difference(tm);

  //   if (difference.compareTo(oneDay) < 1) {
  //     return "Today";
  //   } else if (difference.compareTo(twoDay) < 1) {
  //     return "Yesterday";
  //   } else {
  //     return "${tm.day} $month ${tm.year}";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddPost()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Posts',
              style: TextStyle(fontSize: 20),
            ),
            // _showDatePicker(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.white],
          ),
        ),
        child: StreamBuilder(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                InfoPost(snapshot.data!.docs[index])));
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shadowColor: Colors.purple[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data!.docs[index].get('title'),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.edit, color: Colors.purple[600]),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
