// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../api.dart';

// ignore: use_key_in_widget_constructors
class RegsiterScreen extends StatefulWidget {
  @override
  _RegsiterScreenState createState() => _RegsiterScreenState();
}

class _RegsiterScreenState extends State<RegsiterScreen> {
  var result;
  bool flag = true;
  bool npl = true;
  // ignore: prefer_final_fields
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  // TextEditingController mobile = TextEditingController();
  int _value = 1;
  // Future registrationUser() async {
  //   // url to registration php script
  //   var apiURL = "http://192.168.18.8:8000/api/cate";
  //   //json maping user entered details
  //   Map mapeddate = {
  //     'category_id': _value.toString(),
  //   };
  //   //send  data using http post to our php code
  //   http.Response reponse = await http.post(Uri.parse(apiURL), body: mapeddate);
  //   //getting response from php code, here
  //   var data = jsonDecode(reponse.body);
  //   print(data);
  // }

  void _showialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sorry ", style: TextStyle(color: Colors.red)),
          content: const Text("Registration failed",
              style: TextStyle(color: Colors.red)),
          actions: [
            ElevatedButton(
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        validator: (value) =>
                            value!.isEmpty ? "required" : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_add),
                          hintText: "Enter Your Name",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (val) =>
                            !val!.contains('@') ? 'Invalid Email' : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   controller: mobile,
                      //   validator: (value) => value!.length < 10
                      //       ? "Please enter valid number"
                      //       : null,
                      //   decoration: InputDecoration(
                      //     prefixIcon: Icon(Icons.phone_android),
                      //     hintText: "Mobile Number",
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: flag,
                        validator: (val) => val!.length < 6
                            ? 'Password too short at least 6 letters'
                            : null,
                        controller: password,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: flag == true
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                if (flag == true) {
                                  flag = false;
                                } else {
                                  flag = true;
                                }
                                setState(() {});
                              }),
                          hintText: "Password",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: npl,
                        controller: cpassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: npl == true
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                if (npl == true) {
                                  npl = false;
                                } else {
                                  npl = true;
                                }
                                setState(() {});
                              }),
                          hintText: "Confirm Password",
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "required";
                          }
                          if (password.text != password.text) {
                            return "password don't match";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_key.currentState!.validate()) {
                                      Map data = {
                                        'name': name.text,
                                        'email': email.text,
                                        // 'mobile': mobile.text,
                                        'password': password.text,
                                      };
                                      // ignore: avoid_print
                                      print("Register Successful");
                                      var response = await Api()
                                          .loginRegister(data, 'register');
                                      var result = json.decode(response.body);
                                      if (result['code'] == 401) {
                                        _showialog(context);
                                      }
                                      if (result['code'] == 200) {
                                        // ignore: avoid_print
                                        print("Register Successful");
                                        // return "Register Successful";
                                        Navigator.popAndPushNamed(
                                            context, 'login');
                                        // SharedPreferences preferences =
                                        //     await SharedPreferences.getInstance();
                                        // preferences.setString('token', result['token']);

                                      }

                                      // ignore: avoid_print
                                      print(result['code']);
                                    }
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: const Text(
                                    "Already Have an Account",
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
