import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/core/services/auth.dart';
import 'package:project/dashboard.dart';
import 'package:project/new_Entry.dart';
import 'package:project/time_Sheet.dart';

import 'drawer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
AuthServices _auth = AuthServices();

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: HexColor("#F8F8F8"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 15,
                  color: HexColor("#E13094"),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                        color: HexColor(
                          "#3D3090",
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Welcome back to Changing Lives!",
                    style: TextStyle(
                        color: HexColor(
                          "#E13094",
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: HexColor(
                            "#E13094",
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Enter your details and head into the app",
                      style: TextStyle(
                          color: HexColor(
                            "#3D3090",
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _emailController,
                              validator: (val) =>
                                  val!.isEmpty ? "Field is empty" : null,
                              onChanged: (val) {
                                setState(() {
                                  val = _emailController.text;
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                fillColor: HexColor("#E13094"),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (val) =>
                                  val!.isEmpty ? "Field is empty" : null,
                              onChanged: (val) {
                                setState(() {
                                  val = _passwordController.text;
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                fillColor: HexColor("#E13094"),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15)),
                                prefixIcon: Icon(
                                  Icons.lock_sharp,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    isLoading == false
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                dynamic result =
                                    await _auth.signInWIthEmailPAss(
                                        _emailController.text,
                                        _passwordController.text,
                                        context);

                                if (result == null) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (ctx) => Dashboard()));
                                }
                              }
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (ctx) => NewEntry()));

                              _emailController.clear();
                              _passwordController.clear();
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                fixedSize:
                                    MaterialStateProperty.all(Size(200, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    HexColor("#3D3090"))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    "Enter",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.arrow_right_alt)
                              ],
                            ),
                          )
                        : CircularProgressIndicator(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
