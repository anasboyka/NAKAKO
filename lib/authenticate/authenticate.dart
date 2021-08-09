import 'package:flutter/material.dart';
import 'package:nakako/authenticate/register.dart';

import 'login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showlogin = true;

  void toggleview() {
    setState(() {
      return showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showlogin) {
      return Register(toggleview: toggleview);
    } else {
      return Login(toggleview: toggleview);
    }
  }
}
