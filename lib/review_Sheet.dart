// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:project/core/services/database.dart';
// import 'package:project/drawer.dart';
// import 'package:project/edit_time_entry.dart';

// class ReviewSheet extends StatefulWidget {
//   //const ReviewSheet({Key? key,this.dltEntry}) : super(key: key);

//   @override
//   _ReviewSheetState createState() => _ReviewSheetState();
// }

// class _ReviewSheetState extends State<ReviewSheet> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey();

// final textColor = HexColor("#3D3090");
//   bool isLoading = false;
//   late Database db;
//   late Map dltEntry;
//   List docs = [];
//   initialise() {
//     db = Database();
//     db.initiliase();
//     db.read().then((value) => {
//           setState(() {
//             docs = value;
//           })
//         });
//   }

//   @override
//   void initState() {
//     super.initState();
//     initialise();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       key: _key,
//       drawer: NavDrawer(),
//       backgroundColor: HexColor("#F8F8F8"),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: IconButton(
//                             onPressed: () {
//                               _key.currentState!.openDrawer();
//                             },
//                             icon: Icon(
//                               Icons.menu,
//                               color: Colors.pink,
//                             ))),
//                     Image(
//                       image: AssetImage("assets/images/androilogo.png"),
//                       height: 40,
//                     ),
//                     Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Image(
//                           image: AssetImage("assets/images/profilePic.png"),
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: Text(
//                   "Review Timesheet",
//                   style: TextStyle(
//                       color: HexColor(
//                         "#3D3090",
//                       ),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.only(right: 20),
//                 height: MediaQuery.of(context).size.height * 0.32,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         blurRadius: 5,
//                       )
//                     ]),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.pinkAccent.withOpacity(0.2),
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.black,
//                               size: 40,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Jonny Beaver",
//                                 style: TextStyle(
//                                     color: HexColor(
//                                       "#3D3090",
//                                     ),
//                                     fontSize: 20),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.calendar_today_rounded,
//                                     color: HexColor(
//                                       "#3D3090",
//                                     ),
//                                     size: 15,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     "01/11/20 - 14/11/21",
//                                     style: TextStyle(
//                                         color: HexColor(
//                                           "#3D3090",
//                                         ),
//                                         fontSize: 15),
//                                   )
//                                 ],
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Divider(),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.av_timer_outlined,
//                             color: HexColor(
//                               "#3D3090",
//                             ),
//                             size: 20,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             "Total time volunteered",
//                             style: TextStyle(
//                                 color: HexColor(
//                                   "#3D3090",
//                                 ),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "48 hours",
//                         style: TextStyle(
//                             color: HexColor(
//                               "#3D3090",
//                             ),
//                             fontSize: 20),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "4,578 minutes",
//                         style: TextStyle(
//                             color: HexColor(
//                               "#3D3090",
//                             ),
//                             fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Entries (${docs.length})",
//                 style: TextStyle(
//                     color: HexColor(
//                       "#3D3090",
//                     ),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30),
//               ),
//             ],
//           ),
//           Expanded(
//             flex: 8,
//             child: docs.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: docs.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 20),
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: MediaQuery.of(context).size.height,
//                               width: 5,
//                               decoration: BoxDecoration(
//                                   color: Colors.blueAccent.shade100,
//                                   borderRadius: BorderRadius.circular(2)),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                               color: Colors.pink.shade200))),
//                                   margin: EdgeInsets.only(
//                                       top: 20, bottom: 15, left: 20, right: 15),
//                                   padding: EdgeInsets.only(bottom: 18),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.8,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               "Jonny B",
//                                               style: TextStyle(
//                                                   color: textColor,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16),
//                                             ),
//                                             Row(
//                                               children: [
//                                                 GestureDetector(
// onTap: () {
//   Navigator.of(context)
//       .pushReplacement(
//           MaterialPageRoute(
//               builder: (ctx) =>
//                   EditEntry(
//                     index: docs[
//                         index],
//                     startTime:
//                         docs[index]
//                             [
//                             "from"],
//                     endTime: docs[
//                             index]
//                         [
//                         "to"],
//                     project: docs[
//                             index]
//                         [
//                         "project"],
//                     additionalInfo:
//                         docs[index]
//                             [
//                             "additionalInfo"],
//                     selected:
//                         docs[index]
//                             [
//                             "date"],
//                   )));
// },
//                                                   child: Container(
//                                                     alignment: Alignment.center,
//                                                     height: 30,
//                                                     width: 40,
//                                                     decoration: BoxDecoration(
//                                                         color: HexColor(
//                                                                 "#E13B9A")
//                                                             .withOpacity(0.1),
//                                                         shape: BoxShape.circle),
//                                                     child: Icon(Icons.edit,
//                                                         color: Colors.pink,
//                                                         size: 13),
//                                                   ),
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     dltEntry = docs[index];
//                                                     db.delete(dltEntry["id"]);
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: Container(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       height: 30,
//                                                       width: 85,
//                                                       decoration: BoxDecoration(
//                                                           color: HexColor(
//                                                                   "#E13B9A")
//                                                               .withOpacity(0.1),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       15)),
//                                                       child: Text(
//                                                         "Remove",
//                                                         style: TextStyle(
//                                                             color: Colors.pink,
//                                                             fontSize: 13),
//                                                       )),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.calendar_today,
//                                             color: textColor,
//                                             size: 16,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             "${docs[index]["date"]}",
//                                             style: TextStyle(
//                                               color: textColor,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.av_timer_outlined,
//                                             color: textColor,
//                                             size: 16,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             "3:30 Hrs",
//                                             style: TextStyle(
//                                               color: textColor,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                       bottom: 15, left: 20, right: 15),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "${docs[index]["project"]}",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           color: textColor,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(top: 10),
//                                         width:
//                                             MediaQuery.of(context).size.width -
//                                                 70,
//                                         child: Text(
//                                           "${docs[index]["additionalInfo"]}",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w300,
//                                             color: textColor,
//                                             fontSize: 11,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/core/services/database.dart';

import 'edit_time_entry.dart';

class ReviewSheet extends StatefulWidget {
  const ReviewSheet({Key? key}) : super(key: key);

  @override
  _ReviewSheetState createState() => _ReviewSheetState();
}

final textColor = HexColor("#3D3090");
final GlobalKey<ScaffoldState> _key = GlobalKey();

bool isLoading = false;

class _ReviewSheetState extends State<ReviewSheet> {
  late Database db;
  late Map dltEntry;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F8F8F8"),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
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
        body: Stack(
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Review Timesheet",
                      style: TextStyle(
                          color: HexColor(
                            "#3D3090",
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/profilePic.png"),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jonny Beaver",
                                      style: TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: textColor,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "01/11/2021 - 14/11/2021",
                                          style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: textColor,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Total time volunteered",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: textColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "48 hours",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: textColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "4578 minutes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: textColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Entries (${docs.length})",
                      style: TextStyle(
                          color: HexColor(
                            "#3D3090",
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (contex, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: MediaQuery.of(context).size.height * 0.3,
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
                                                  color:
                                                      Colors.pink.shade200))),
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
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (ctx) =>
                                                                            EditEntry(
                                                                              index: docs[index],
                                                                              startTime: docs[index]["from"],
                                                                              endTime: docs[index]["to"],
                                                                              project: docs[index]["project"],
                                                                              additionalInfo: docs[index]["additionalInfo"],
                                                                              selected: docs[index]["date"],
                                                                            )));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 30,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            color: HexColor(
                                                                    "#E13B9A")
                                                                .withOpacity(
                                                                    0.1),
                                                            shape: BoxShape
                                                                .circle),
                                                        child: Icon(Icons.edit,
                                                            color: Colors.pink,
                                                            size: 13),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        dltEntry = docs[index];
                                                        db.delete(
                                                            dltEntry["id"]);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 30,
                                                          width: 85,
                                                          decoration: BoxDecoration(
                                                              color: HexColor(
                                                                      "#E13B9A")
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Text(
                                                            "Remove",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.pink,
                                                                fontSize: 13),
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
                                                "${docs[index]["date"]}",
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
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
                                          bottom: 15, left: 20, right: 15),
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
                                            margin: EdgeInsets.only(top: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                70,
                                            child: Text(
                                              "${docs[index]["additionalInfo"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
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
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
