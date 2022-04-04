import 'package:flutter/material.dart';

import 'onboarding.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Center(
        child: Image.asset("images/splash.png"),
      ),
    ));
  }
}
