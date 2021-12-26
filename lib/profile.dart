import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/core/services/auth.dart';
import 'package:project/login.dart';

import 'drawer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    final textColor = HexColor("#3D3090");
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: NavDrawer(),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      alignment: Alignment.topLeft,
                      color: HexColor("#E13094"),
                      child: Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: HexColor("#C10B72"),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.14),
                              child: Image(
                                image:
                                    AssetImage("assets/images/androilogo.png"),
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: HexColor("#F8F8F8"),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "jony Beaver",
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "@jonnyb",
                                  style:
                                      TextStyle(color: textColor, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 20,
                              leading: Icon(
                                Icons.person_outline,
                                color: textColor,
                              ),
                              title: Text(
                                "Personal Info",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 20,
                              leading: Icon(
                                Icons.lock_open_outlined,
                                color: textColor,
                              ),
                              title: Text(
                                "Password Settings",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () async {
                                await _auth.signOut();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => Login()));
                              },
                              minLeadingWidth: 20,
                              leading: Icon(
                                Icons.logout_outlined,
                                color: textColor,
                              ),
                              title: Text(
                                "Logout",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.17),
              child: CircleAvatar(
                radius: 75,
                backgroundColor: HexColor("#FBE5F2"),
                backgroundImage: AssetImage("assets/images/profilePic.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
