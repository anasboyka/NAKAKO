import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function toggleview;
  Login({this.toggleview});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcon = new TextEditingController();
  final passcon = new TextEditingController();
  String email = "", password = "", error = "";
  bool loading = false, _ishidden = true;
  final _formkey = GlobalKey<FormState>();
  //firebase bawah ni

  void togglePassswordVisibility() {
    setState(() {
      _ishidden = !_ishidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height*0.009, horizontal: size.width*0.0717),//8,31
          child: Image.asset('assets/logo/logoblack.png',height: size.height*0.0698,),
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
                padding: EdgeInsets.fromLTRB(size.width*0.118, size.height*0.0625, 0, size.height*0.04), //51,51,0,33
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: size.height*0.0196,//16
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
                height: size.height * 0.119,
                constraints: BoxConstraints(
                  minHeight: 97
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    textform(emailcon, 'EMAIL'),
                    textform(passcon, 'PASSWORD'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.127, size.height*0.0686, size.width*0.127, 0), //55,56,55,0
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
                    onPressed: () {
                      widget.toggleview();
                    },
                    child: Center(
                      child: Text(
                        'LOGIN',
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
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.122, size.height*0.0735, size.width*0.122, size.height*0.06495), //53,60,53,53
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xff707070),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.0231,vertical: 0), //10,0 
                      child: Text(
                        'OR LOGIN WITH',
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue Condensed',
                          fontSize: size.height*0.0140,//11.5,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xff707070),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.122, vertical: 0), //53,0
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width*0.0289,vertical: 0 ), //12,0
                      height: size.height*0.0674,//55
                      width: size.width*0.2962, //128
                      constraints: BoxConstraints(
                        minWidth: 100,
                        maxWidth: size.width
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                          Image.asset(
                            'assets/icon/facebooklogo.png',
                            height: size.height*0.0245, //20
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width*0.0346), //15
                            child: Text(
                              'FACEBOOK',
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue Condensed',
                                fontSize: size.height*0.0171,
                                color: const Color(0xffffffff),
                                letterSpacing: 0.42,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width*0.0289,vertical: 0 ), //12.5,0
                      width: size.width*0.2963, //128
                      height: size.height*0.0674,//55
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/googleLogo.png',
                            height: size.height*0.0245, //20
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width*0.0347), //15
                            child: Text(
                              'GOOGLE',
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue Condensed',
                                fontSize: size.height*0.0171,
                                color: const Color(0xffffffff),
                                letterSpacing: 0.42,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
                              TextSpan(text: 'DON\'T HAVE AN ACCOUNT?\n'),
                              TextSpan(
                                  text: 'REGISTER',
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
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    //switch case
    return Container(
      height: 44,//size.height*0.0539,//44
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.127,vertical: 0), //55,0 
        child: TextFormField(
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
            //contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: size.height*0.0098), //8
            labelText: hint,
            labelStyle: TextStyle(
              fontFamily: 'Arial Narrow',
              fontSize: size.height*0.0134, //11
              color: const Color(0xffe2e2e2),
              fontWeight: FontWeight.w700,
            ),
            suffixIcon: hint == 'PASSWORD'
                ? IconButton(
                    onPressed: togglePassswordVisibility,
                    icon: _ishidden
                        ? Icon(
                            Icons.visibility_off,
                            size: size.height*0.0294,
                            color: Color(0xff707070),
                          )
                        : Icon(
                            Icons.visibility,
                            size: size.height*0.0294,
                            color: Color(0xff707070),
                          ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
