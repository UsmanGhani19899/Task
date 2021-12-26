import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

import 'drawer.dart';

class TimeSheet extends StatefulWidget {
  const TimeSheet({Key? key}) : super(key: key);

  @override
  State<TimeSheet> createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet> {
  List docs = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final textColor = HexColor("#3D3090");

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
                child: Image(image: AssetImage("assets/images/profilePic.png")))
          ],
        ),
        key: _key,
        drawer: NavDrawer(),
        backgroundColor: HexColor("#F8F8F8"),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "TimeSheets",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: textColor),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image(
                              image:
                                  AssetImage("assets/images/androilogo.png"))),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Timesheet Due",
                              style: TextStyle(color: HexColor("#FF6464")),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "01-11-2021 - 14-11-2021",
                              style: TextStyle(
                                  color: HexColor("#FF6464"),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Submit Now",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          height: MediaQuery.of(context).size.height * 0.27,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.shade100,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.pink.shade200))),
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        bottom: 15,
                                        left: 20,
                                        right: 15),
                                    padding: EdgeInsets.only(bottom: 18),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Jonny B",
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: HexColor(
                                                                "#E13B9A")
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.timer,
                                                          color: Colors.pink,
                                                          size: 12,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "Pending",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.pink,
                                                              fontSize: 13),
                                                        )
                                                      ],
                                                    )),
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
                                              "${docs[index]["date"]} - 14-11-2021",
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 15, left: 20, right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
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
                                              "Total time volunteered",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: textColor,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "13 hours",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "30 minutes",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                )
                // Container(
                //   margin: EdgeInsets.only(top: 20, bottom: 10),
                //   height: MediaQuery.of(context).size.height * 0.27,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: MediaQuery.of(context).size.height,
                //         width: 5,
                //         decoration: BoxDecoration(
                //             color: Colors.blueAccent.shade100,
                //             borderRadius: BorderRadius.circular(2)),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //                 border: Border(
                //                     bottom: BorderSide(
                //                         color: Colors.pink.shade200))),
                //             margin: EdgeInsets.only(
                //                 top: 20, bottom: 15, left: 20, right: 15),
                //             padding: EdgeInsets.only(bottom: 18),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Container(
                //                   width:
                //                       MediaQuery.of(context).size.width * 0.8,
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       Text(
                //                         "Jonny B",
                //                         style: TextStyle(
                //                             color: textColor,
                //                             fontWeight: FontWeight.w600,
                //                             fontSize: 16),
                //                       ),
                //                       GestureDetector(
                //                         onTap: () {},
                //                         child: Container(
                //                             height: 30,
                //                             width: 100,
                //                             decoration: BoxDecoration(
                //                                 color: HexColor("#E13B9A")
                //                                     .withOpacity(0.1),
                //                                 borderRadius:
                //                                     BorderRadius.circular(15)),
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 Icon(
                //                                   Icons.timer,
                //                                   color: Colors.pink,
                //                                   size: 12,
                //                                 ),
                //                                 SizedBox(
                //                                   width: 5,
                //                                 ),
                //                                 Text(
                //                                   "Pending",
                //                                   style: TextStyle(
                //                                       color: Colors.pink,
                //                                       fontSize: 13),
                //                                 )
                //                               ],
                //                             )),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Row(
                //                   children: [
                //                     Icon(
                //                       Icons.calendar_today,
                //                       color: textColor,
                //                       size: 16,
                //                     ),
                //                     SizedBox(
                //                       width: 5,
                //                     ),
                //                     Text(
                //                       "01-11-2021 - 14-11-2021",
                //                       style: TextStyle(
                //                         color: textColor,
                //                         fontSize: 16,
                //                       ),
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(
                //                 bottom: 15, left: 20, right: 15),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Icon(
                //                       Icons.speed,
                //                       color: textColor,
                //                       size: 16,
                //                     ),
                //                     SizedBox(
                //                       width: 5,
                //                     ),
                //                     Text(
                //                       "Total time volunteered",
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.w600,
                //                         color: textColor,
                //                         fontSize: 16,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Text(
                //                   "13 hours",
                //                   style: TextStyle(
                //                     color: textColor,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Text(
                //                   "30 minutes",
                //                   style: TextStyle(
                //                     color: textColor,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
