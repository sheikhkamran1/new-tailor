import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtailor/view/register.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool flag = true;

    GlobalKey<FormState> _key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    void _showialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Oops!",
            ),
            content: const Text(
              "Please login with valid number and password",
            ),
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

    // Creating a Object by using GetXHelper Class and injection it in main.dart class so that  you can use getXHelper to call and pass use entered data

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Sign ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                      )),
                  TextSpan(
                      text: 'In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                      )),
                ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "required";
                              }

                              return null;
                            },
                            controller: email,
                            decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.phone_android))),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "required";
                            }
                            if (password.text != password.text) {
                              return "password don't match";
                            }

                            return null;
                          },
                          controller: password,
                          obscureText: flag,
                          decoration: InputDecoration(
                            hintText: "Password",
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
                              },
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            Map data = {
                              'email': email.text,
                              'password': password.text
                            };
                            var response =
                                await Api().loginRegister(data, 'login');
                            var result = json.decode(response.body);
                            if (result['code'] == 500) {
                              _showialog(context);
                            }
                            if (result['code'] == 200) {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString('token', result['token']);
                              // Get.off(HomeScreen());

                              // ignore: avoid_print
                              print(result['code']);
                            }
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.to(RegsiterScreen());
                },
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Are you new user?',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                  TextSpan(
                      text: 'Register',
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:tailor/components/customformfield.dart';
// import 'package:tailor/view/utility/form.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   int _value = 2;
//   bool donkey = true;
//   @override
//   Widget build(BuildContext context) {
//     // SigninController signinController = Get.put(SigninController());
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'Tailor',
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: const Color(0xffeeeeee),
//           elevation: 1,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(color: Color(0xffeeeeee)),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pushNamed(context, "/dashboard");
//                               },
//                               child: Radio(
//                                   value: 1,
//                                   groupValue: _value,
//                                   onChanged: (val) {
//                                     setState(() {
//                                       _value = _value;
//                                     });
//                                   }),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pushNamed(context, "/register");
//                               },
//                               child: RichText(
//                                 text: const TextSpan(
//                                   children: [
//                                     TextSpan(
//                                         text: 'Create an account  ',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold)),
//                                     TextSpan(
//                                       text: 'Are you new?',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, "/register");
//                           },
//                           child: Row(
//                             children: [
//                               Radio(
//                                   value: 2,
//                                   groupValue: _value,
//                                   onChanged: (val) {
//                                     setState(() {
//                                       _value = _value;
//                                     });
//                                   }),
//                               RichText(
//                                 text: const TextSpan(
//                                   children: [
//                                     TextSpan(
//                                         text: 'Already. sign-In?',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold))
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const CustomFormField(
//                           icon: Icons.person,
//                           title: 'Email Address',
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: TextForm.horizontalScreenPadding,
//                               vertical: TextForm.verticalscreenPadding),
//                           child: TextFormField(
//                             obscureText: donkey,
//                             validator: (value) =>
//                                 value!.isEmpty ? "Required" : null,
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                   onPressed: () {
//                                     donkey = !donkey;
//                                     setState(() {});
//                                     print(donkey);
//                                   },
//                                   icon: Icon(
//                                     donkey == false
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                   )),
//                               hintText: "Password",
//                               prefixIcon: const Icon(
//                                 Icons.lock,

//                                 // color: const Color(0xff1a2d40),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, "/forgetpasswordpage");
//                             },
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 18),
//                               child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Text("Forget password")),
//                             )),
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
                                    
//                                     // Navigator.pushNamed(context, "/dashboard");
//                                   },
//                                   child: const Text('Sign In'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: Text(
//                             "By continuing,you agree to Tailor Conditions of Use and Privacy Notice.",
//                             textScaleFactor: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }