import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/ui/Login/login_screen.dart';
import 'package:xpresshealthdev/utils/constants.dart';

import '../../Constants/strings.dart';
import '../../Constants/toast.dart';
import '../../utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOrManager extends StatefulWidget {
  @override
  _UserOrManagerScreenState createState() => _UserOrManagerScreenState();
}

class _UserOrManagerScreenState extends State<UserOrManager> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ToastMsg toastMsg = ToastMsg();

  bool isLoading = false;
  TextEditingController email = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loginResponse();
  }

  @override
  void dispose() {
    // _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/icon/Bg1.png"),
                    fit: BoxFit.fill)),
            child: Container(
                child: Stack(
              children: <Widget>[
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        logoImage(),
                        userButton(),
                        managerButton(),
                        SizedBox(
                          height: screenWidth(context, dividedBy: 6),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 25, top: 0),
                          child: Text(
                            "Powered By Xpress Health",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "SFProMedium"),
                          ),
                        ),
                      ],
                    )),
              ],
            )),
          ),
        ),
      ],
    );
  }

  Widget managerButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 35, right: 35),
            child: Stack(
              children: [
                Visibility(
                  visible: !visible,
                  child: Container(
                    color: Colors.transparent,
                    height: commonButtonHeight(context),
                    width: screenWidth(context, dividedBy: 1),
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('user', false);
                        print('Button Clicked');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('Manager', style: TextStyle(fontSize: 12.sp)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              side:
                                  BorderSide(color: Colors.white, width: 2.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Constants.colors[3]),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget userButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 35, right: 35),
            child: Stack(
              children: [
                Visibility(
                  visible: !visible,
                  child: Container(
                    height: commonButtonHeight(context),
                    width: screenWidth(context, dividedBy: 1),

                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('user', true);
                        print('Button Clicked');
                        print('Button Clicked');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('User', style: TextStyle(fontSize: 12.sp)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Constants.colors[10],
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              side:
                                  BorderSide(color: Colors.white, width: 2.0))),
                    ),

                    // child: RaisedButton(
                    //   onPressed: () async {
                    //     final prefs = await SharedPreferences.getInstance();
                    //     await prefs.setBool('user', true);
                    //     print('Button Clicked');
                    //     print('Button Clicked');
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => LoginScreen()));
                    //   },
                    //   child: Text('User', style: TextStyle(fontSize: 12.sp)),
                    //   color: Colors.white,
                    //   //HexColor('#6587da'),
                    //   textColor: Colors.black,
                    //
                    //   elevation: 0,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: new BorderRadius.circular(7.0),
                    //   ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Constants.colors[3]),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget logoImage() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Stack(
              children: [
                Visibility(
                  visible: true,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      width: 65.w,
                      child: SvgPicture.asset(
                        'assets/images/icon/whitelogo.svg',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Constants.colors[3]),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
