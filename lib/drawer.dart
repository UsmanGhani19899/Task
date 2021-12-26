import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/current_time_entry.dart';
import 'package:project/dashboard.dart';
import 'package:project/edit_time_entry.dart';
import 'package:project/new_Entry.dart';
import 'package:project/profile.dart';
import 'package:project/review_Sheet.dart';
import 'package:project/time_Sheet.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final textColor = HexColor("#3D3090");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Android App"),
            accountEmail: Text("androidap@gmail.com"),
            currentAccountPicture: CircleAvatar(
              radius: 75,
              backgroundColor: HexColor("#FBE5F2"),
              backgroundImage: AssetImage("assets/images/profilePic.png"),
            ),
            decoration: BoxDecoration(
              color: HexColor('#E13094'),
            ),
          ),
          ListTile(
            title: Text("Dashboard"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
            },
          ),
          ListTile(
            title: Text("Add New Entry"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NewEntry()));
            },
          ),
          ListTile(
            title: Text("Review Sheet"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ReviewSheet()));
            },
          ),
          ListTile(
            title: Text("Edit Entres"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditEntry()));
            },
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile()));
            },
          ),
          ListTile(
            title: Text("Current time entry"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CurrentTimeEntries()));
            },
          ),
          ListTile(
            title: Text("TimeSheet"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TimeSheet()));
            },
          ),
        ],
      ),
    );

    // Drawer(
    //   child: Column(
    //     children: [
    //       Expanded(
    //           flex: 2,
    //           child: Container(
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             color: HexColor("#E13094"),
    //             child: Row(
    //               children: [
    //                 CircleAvatar(
    //                   radius: 40,
    //                   backgroundColor: HexColor("#FBE5F2"),
    //                   child: Image(
    //                     image: AssetImage("assets/images/profilePic.png"),
    //                     height: 60,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 15,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       "Jonny Beaver",
    //                       style: TextStyle(
    //                           color: textColor,
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                     Text(
    //                       "@jonnyb",
    //                       style: TextStyle(
    //                           color: textColor,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.w300),
    //                     )
    //                   ],
    //                 )
    //               ],
    //             ),
    //           )),
    //       Expanded(
    //           flex: 6,
    //           child: Container(
    //             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    //             color: HexColor("#F8F8F8"),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(15)),
    //                   child: ListTile(
    //                     onTap: () {
    //                       Navigator.of(context).pushReplacement(
    //                           MaterialPageRoute(builder: (ctx) => Profile()));
    //                     },
    //                     leading: Icon(
    //                       Icons.home,
    //                       color: textColor,
    //                     ),
    //                     title: Text(
    //                       "Home",
    //                       style: TextStyle(color: textColor),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ))
    //     ],
    //   ),
    // );
  }
}
