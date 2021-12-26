import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:project/core/services/database.dart';
import 'package:project/dashboard.dart';
import 'package:project/drawer.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:project/review_Sheet.dart';

class NewEntry extends StatefulWidget {
  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final textColor = HexColor("#3D3090");
  late Database db;
  List docs = [];
  initialise() {
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
    initialise();
  }

  final maxLines = 10;

  Widget _titleText(String title) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          "$title",
          style: TextStyle(
              color: textColor, fontSize: 17, fontWeight: FontWeight.bold),
        ));
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fromcontroller = TextEditingController();
  TextEditingController _tocontroller = TextEditingController();
  TextEditingController _projectcontroller = TextEditingController();
  TextEditingController _addtionalInfocontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  //String _startTime = DateFormat("hh:mm").format(DateTime.now());
  //_startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  String _endTime = "9:30 AM";
  DateTime _currentDate = DateTime(2021, 12, 3);
  DateTime _currentDate2 = DateTime(2021, 12, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2021, 12, 3));
  DateTime _targetDateTime = DateTime(2021, 12, 3);
  String selected = '';
  @override
  Widget build(BuildContext context) {
    // var providerData = Provider.of<NewEntryCrud>(context);

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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.pink,
                    ))),
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
                  child:
                      Image(image: AssetImage("assets/images/profilePic.png")))
            ],
          ),
          key: _key,
          // backgroundColor: HexColor("#F8F8F8"),
          drawer: NavDrawer(),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
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
                  color: Colors.black,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "Add New Entry",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: textColor),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: HexColor("#FBE5F2"),
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/profilePic.png",
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "jony Beaver",
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "View profile",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * 0.53,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              //custom icon
                              // This trailing comma makes auto-formatting nicer for build methods.
                              //custom icon without header
                              Container(
                                margin: EdgeInsets.only(
                                  top: 30.0,
                                  bottom: 16.0,
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                child: new Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(
                                      _currentMonth,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    )),
                                    IconButton(
                                      icon: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        setState(() {
                                          _targetDateTime = DateTime(
                                              _targetDateTime.year,
                                              _targetDateTime.month - 1);
                                          _currentMonth = DateFormat.yMMM()
                                              .format(_targetDateTime);
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        setState(() {
                                          _targetDateTime = DateTime(
                                              _targetDateTime.year,
                                              _targetDateTime.month + 1);
                                          _currentMonth = DateFormat.yMMM()
                                              .format(_targetDateTime);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                child: CalendarCarousel<Event>(
                                  onDayPressed: (date, events) {
                                    setState(() {
                                      _currentDate2 = date;
                                      selected = DateFormat.yMMMd()
                                          .format(_currentDate2);
                                      print("SETSTATE KE ANDER $selected");
                                    });
                                  },
                                  daysHaveCircularBorder: true,
                                  showOnlyCurrentMonthDate: false,
                                  weekendTextStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  thisMonthDayBorderColor: Colors.transparent,
                                  weekFormat: false,
//      firstDayOfWeek: 4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  selectedDateTime: _currentDate2,
                                  targetDateTime: _targetDateTime,
                                  customGridViewPhysics:
                                      NeverScrollableScrollPhysics(),
                                  markedDateCustomShapeBorder: CircleBorder(
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  markedDateCustomTextStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                  selectedDayBorderColor: Colors.transparent,
                                  showHeader: false,
                                  todayTextStyle: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  todayButtonColor: Colors.white,
                                  selectedDayTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  minSelectedDate: _currentDate
                                      .subtract(Duration(days: 360)),
                                  maxSelectedDate:
                                      _currentDate.add(Duration(days: 360)),
                                  prevDaysTextStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.pinkAccent,
                                  ),
                                  inactiveDaysTextStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),

                                  selectedDayButtonColor: Colors.pink,
                                  onCalendarChanged: (DateTime date) {
                                    setState(() {
                                      _targetDateTime = date;
                                      _currentMonth = DateFormat.yMMM()
                                          .format(_targetDateTime);
                                    });
                                  },
                                  onDayLongPressed: (DateTime date) {
                                    print('long pressed date $date');
                                  },
                                ),
                              ), //
                            ],
                          ),
                          //       child:  Center(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       const SizedBox(height: 20.0),
                          //       ElevatedButton(
                          //         child: Text('Basics'),
                          //         onPressed: () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (_) => TableBasicsExample()),
                          //         ),
                          //       ),
                          //       const SizedBox(height: 12.0),
                          //       ElevatedButton(
                          //         child: Text('Range Selection'),
                          //         onPressed: () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (_) => TableRangeExample()),
                          //         ),
                          //       ),
                          //       const SizedBox(height: 12.0),
                          //       ElevatedButton(
                          //         child: Text('Events'),
                          //         onPressed: () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (_) => TableEventsExample()),
                          //         ),
                          //       ),
                          //       const SizedBox(height: 12.0),
                          //       ElevatedButton(
                          //         child: Text('Multiple Selection'),
                          //         onPressed: () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (_) => TableMultiExample()),
                          //         ),
                          //       ),
                          //       const SizedBox(height: 12.0),
                          //       ElevatedButton(
                          //         child: Text('Complex'),
                          //         onPressed: () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (_) => TableComplexExample()),
                          //         ),
                          //       ),
                          //       const SizedBox(height: 20.0),
                          //     ],
                          //   ),
                          // ),
                        ),
                        _titleText("Add time"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: TextFormField(
                                controller: _fromcontroller,
                                onTap: () {
                                  _getTimeFromUser(isStartTime: true);
                                  setState(() {});
                                },
                                // validator: (val) => _fromcontroller.text.isEmpty
                                //     ? "Please enter Something"
                                //     : null,
                                // onChanged: (val) {
                                //   setState(() {
                                //     val = _fromcontroller.text;
                                //   });
                                // },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintStyle: TextStyle(color: textColor),
                                  hintText: _startTime,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: TextFormField(
                                controller: _tocontroller,
                                onTap: () {
                                  _getTimeFromUser(isStartTime: false);
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintStyle: TextStyle(color: textColor),
                                  hintText: _endTime,
                                ),
                              ),
                            ),
                          ],
                        ),
                        _titleText("Project"),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                controller: _projectcontroller,
                                validator: (val) =>
                                    _projectcontroller.text.isEmpty
                                        ? "Please enter Something"
                                        : null,
                                onChanged: (val) {
                                  setState(() {
                                    val = _projectcontroller.text;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: TextStyle(color: textColor),
                                    hintText: "Select one"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // setState(() {
                                      //   Loader.show(context,
                                      //       isSafeAreaOverlay: false,
                                      //       isAppbarOverlay: true,
                                      //       isBottomBarOverlay: false,
                                      //       progressIndicator:
                                      //           CircularProgressIndicator(),
                                      //       themeData: Theme.of(context).copyWith(
                                      //           colorScheme:
                                      //               ColorScheme.fromSwatch()
                                      //                   .copyWith(
                                      //                       secondary:
                                      //                           Colors.black38)),
                                      //       overlayColor: Color(0x99E8EAF6));
                                      // });
                                      db.create(
                                        _startTime,
                                        _endTime,
                                        _projectcontroller.text,
                                        _addtionalInfocontroller.text,
                                        selected,
                                      );
                                      // setState(() {
                                      //   Loader.hide();
                                      // });

                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => ReviewSheet()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          top: 22,
                                          bottom: 22,
                                          left: 22,
                                          right: 22),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(34)),
                                      primary: HexColor("#E13094")),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                        _titleText("Additional info"),
                        Container(
                          height: maxLines * 30,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            controller: _addtionalInfocontroller,
                            validator: (val) =>
                                _addtionalInfocontroller.text.isEmpty
                                    ? "Please enter Something"
                                    : null,
                            onChanged: (val) {
                              setState(() {
                                val = _addtionalInfocontroller.text;
                              });
                            },
                            maxLines: maxLines,
                            decoration: InputDecoration(
                                //    contentPadding: EdgeInsets.symmetric(vertical: 80),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(color: textColor),
                                hintText: "Type here"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  _getTimeFromUser({bool? isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime!)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0])),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  _getDateFromUser() async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    }
  }
}
