import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nakako/authenticate/authenticate.dart';
import 'package:nakako/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailcon = new TextEditingController();
  final passcon = new TextEditingController();
  final mobilenocon = new TextEditingController();
  final fnamecon = new TextEditingController();
  final lnamecon = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String email = "",
      password = "",
      mobileNo = "",
      fname = "",
      lname = "",
      error = "";
  bool loading = false, _ishidden = true;
  final AuthService _auth = AuthService();
  //firebase bawah ni
  void togglePassswordVisibility() {
    setState(() {
      _ishidden = !_ishidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.009, horizontal: size.width * 0.0717),
          child: Image.asset('assets/logo/logoblack.png',
              height: size.height * 0.0698),
        ),
      ),
      //extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.118,
                    size.height * 0.0625, 0, size.height * 0.0490),
                child: Text(
                  'PERSONAL DETAILS ',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: size.height * 0.0196,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // SizedBox(
              //   height: size.height * 1/17,
              // ),
              Container(
                height: size.height * 0.3,
                constraints: BoxConstraints(
                  minHeight: 240,
                  maxHeight: size.height
                ),
                width: double.infinity,
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textform(emailcon, 'EMAIL'),
                      textform(passcon, 'PASSWORD'),
                      textform(mobilenocon, 'MOBILE NUMBER'),
                      textform(fnamecon, 'FIRST NAME'),
                      textform(lnamecon, 'LAST NAME'),
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height: size.height * 0.04,
              // ),
              Padding(
                padding:
                   EdgeInsets.fromLTRB(size.width*0.127, size.height*0.0686, size.width*0.127, 0), //55,56,55,0
                child: Container(
                  height: size.height*0.0539, //44
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                    ),
                    onPressed: () async {
                      //register
                      if (_formkey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = "Please supply a valid email";
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: size.height*0.0183, //15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.127, size.height*0.0134, size.width*0.127, 0), //55,11,55,0
                child: Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontFamily: 'HelveticaNeue-Condensed Thin',
                          fontSize: size.height*0.0098,//8,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700
                          //fontStyle: FontStyle.normal
                          ),
                      children: [
                        TextSpan(
                            text:
                                '*BY CREATING YOUR ACCOUNT OR SINGING IN, YOU AGREE TO OUR '),
                        TextSpan(
                            text: 'TERMS AND CONDITIONS',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('terms & condition');
                              }),
                        TextSpan(text: '&'),
                        TextSpan(
                            text: 'PRIVACY POLICY.',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('privacy policy');
                              }),
                      ]),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: size.height*0.0183,//15
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(text: 'HAVE AN ACCOUNT?\n'),
                              TextSpan(
                                  text: 'LOGIN',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      widget.toggleview();
                                    }),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textform(TextEditingController controller, String hint) {
    //switch case
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 44,//size.height*0.0539,//44,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.127, vertical: 0), //55,0
        child: TextFormField(
          validator: (val) {
            if (hint == "EMAIL") {
              return val.isEmpty ? "Enter an Email" : null;
            } else if (hint == "PASSWORD") {
              return val.length < 6
                  ? "password must be at least 6 character"
                  : null;
            } else if (hint == "MOBILE NUMBER") {
              return val.isEmpty ? "Enter Mobile Phone Number" : null;
            } else if (hint == "FIRST NAME") {
              return val.isEmpty ? "Enter First Name" : null;
            } else if (hint == "LAST NAME") {
              return val.isEmpty ? "Enter Last Name" : null;
            }
          },
          onChanged: (val) {
            setState(() {
              if (hint == "EMAIL") {
                email = val;
              } else if (hint == "PASSWORD") {
                password = val;
              } else if (hint == "MOBILE NUMBER") {
                mobileNo = val;
              } else if (hint == "FIRST NAME") {
                fname = val;
              } else if (hint == "LAST NAME") {
                lname = val;
              }
            });
          },
          controller: controller,
          obscureText: hint == 'PASSWORD' ? _ishidden : false,
          style: TextStyle(
            fontFamily: 'Arial Narrow',
            fontSize: size.height*0.0187, //13
            color: const Color(0xffe2e2e2),
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xff707070)),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xff707070)),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: size.height*0.0098), // 0,8
            labelText: hint,
            labelStyle: TextStyle(
              fontFamily: 'Arial Narrow',
              fontSize: size.height*0.0134,//11
              color: const Color(0xffe2e2e2),
              fontWeight: FontWeight.w700,
            ),
            suffixIcon: hint == 'PASSWORD'
                ? IconButton(
                    onPressed: togglePassswordVisibility,
                    icon: _ishidden
                        ? Icon(
                            Icons.visibility_off,
                            color: Color(0xff707070),
                            size: size.height*0.0294,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Color(0xff707070),
                            size: size.height*0.0294,
                          ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
