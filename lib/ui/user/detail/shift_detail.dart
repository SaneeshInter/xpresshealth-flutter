import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/ui/user/detail/shift_rows.dart';

import '../../../utils/constants.dart';
import '../../Widgets/buttons/call_button.dart';
import '../../Widgets/buttons/submit_button.dart';
import '../app_bar.dart';
import '../side_menu.dart';
import 'drawable_custom_row.dart';

class ShiftDetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(
        _scaffoldKey,
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: Constants.colors[9],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30.h,
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(10), // Image radius
                            child: Image.asset(
                              "assets/images/icon/dubai.jpg",
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 10),
                                      child: Text(
                                        'At : St george Hospital',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily: "SFProMedium",
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    CustomRow(
                                      onPressed: () {},
                                      label: "Location Dubai",
                                      asset: "assets/images/icon/location.svg",
                                      textColors: Colors.green,
                                      size: 9.sp,
                                    ),
                                    CustomRow(
                                      onPressed: () {},
                                      label: "11.00 AM To 12.00 PM",
                                      asset: "assets/images/icon/time.svg",
                                      textColors: Colors.black,
                                      size: 9.sp,
                                    ),
                                    CustomRow(
                                      onPressed: () {},
                                      label: "ITU-INTENSIVE THERAPY UNIT",
                                      asset: "assets/images/icon/ward.svg",
                                      textColors: Colors.black,
                                      size: 9.sp,
                                    ),
                                    CustomRow(
                                      onPressed: () {},
                                      label: "sanjaybraham@xpresshealth.ie",
                                      asset: "assets/images/icon/email.svg",
                                      textColors: Colors.black,
                                      size: 9.sp,
                                    ),
                                    CustomRow(
                                      onPressed: () {},
                                      label: "SPEC",
                                      asset: "assets/images/icon/price-tag.svg",
                                      textColors: Colors.black,
                                      size: 9.sp,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Divider(
                                        thickness: 1,
                                        indent: 12,
                                        endIndent: 12,
                                      ),
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: EdgeInsets.only(top: 20,left: 20),
                    width: 60.w,
                    height: 5.h,
                    child: SubmitButton(
                      onPressed: () {},
                      label: "Book this shift",
                      textColors: Constants.colors[0],
                      color1: Constants.colors[3],
                      color2: Constants.colors[4],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CallButton(
                      onPressed: () {},
                      key: null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
