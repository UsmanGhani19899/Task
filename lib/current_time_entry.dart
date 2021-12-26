import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/core/models/new_entry_model.dart';
import 'package:project/core/services/database.dart';

import 'package:intl/intl.dart' show DateFormat;
import 'package:project/widgets/date_picker_timeline.dart';

import 'drawer.dart';

class CurrentTimeEntries extends StatefulWidget {
  CurrentTimeEntries({Key? key}) : super(key: key);

  @override
  State<CurrentTimeEntries> createState() => _CurrentTimeEntriesState();
}

class _CurrentTimeEntriesState extends State<CurrentTimeEntries> {
  late Database db;
  late Map dltEntry;
  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());

  List docs = [];
  initialise() {
    print("HRRR WQT CHLEA");
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    print("HRRR WQT CHLEA");
    initialise();
  }

  final textColor = HexColor("#3D3090");
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.pink,
                ),
              )),
          title: Image(
            image: AssetImage("assets/images/androilogo.png"),
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image(image: AssetImage("assets/images/profilePic.png")))
          ],
        ),
        key: _key,
        drawer: NavDrawer(),
        backgroundColor: HexColor("#F8F8F8"),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  //   fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage("assets/images/appImg.png"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Time Entries",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: textColor),
                      )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: DatePicker(
                            DateTime.now(),
                            width: 40,
                            height: 90,
                            controller: _controller,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: HexColor("#E13094"),
                            selectedTextColor: Colors.white,
                            dateTextStyle: TextStyle(fontSize: 15),
                            dayTextStyle:
                                TextStyle(color: textColor, fontSize: 10),
                            monthTextStyle: TextStyle(
                                color: Colors.transparent, fontSize: 1),
                            onDateChange: (date) {
                              // New date selected

                              setState(
                                () {
                                  _selectedDate = date;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          print("FIREBASE  WALI  " + docs[index]['date']);
                          print(DateFormat.yMMMd().format(_selectedDate));
                          if (docs[index]['date'] ==
                              DateFormat.yMMMd().format(_selectedDate)) {
                            print("IF WALI");
                            initialise();
                            return Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent.shade100,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors
                                                            .pink.shade200))),
                                            margin: EdgeInsets.only(
                                                top: 20,
                                                bottom: 15,
                                                left: 20,
                                                right: 15),
                                            padding:
                                                EdgeInsets.only(bottom: 18),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Jonny B",
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 30,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: HexColor(
                                                                          "#E13B9A")
                                                                      .withOpacity(
                                                                          0.1),
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .pink,
                                                                  size: 13),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 30,
                                                                width: 85,
                                                                decoration: BoxDecoration(
                                                                    color: HexColor(
                                                                            "#E13B9A")
                                                                        .withOpacity(
                                                                            0.1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: Text(
                                                                  "Remove",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pink,
                                                                      fontSize:
                                                                          13),
                                                                )),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today,
                                                      color: textColor,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "${docs[index]['date']}",
                                                      style: TextStyle(
                                                        color: textColor,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.speed,
                                                      color: textColor,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "3:30 Hrs",
                                                      style: TextStyle(
                                                        color: textColor,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 15,
                                                left: 20,
                                                right: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${docs[index]["project"]}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: textColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      70,
                                                  child: Text(
                                                    "${docs[index]["additionalInfo"]}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: textColor,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                ClipOval(
                                  child: Material(
                                    color: HexColor("#E13094"), // Button color
                                    child: InkWell(
                                      splashColor: Colors.white, // Splash color
                                      onTap: () {},
                                      child: SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(Icons.add)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            print("ELSE WALI");
                            return Container();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
