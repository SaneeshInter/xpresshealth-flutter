import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/user/detail/home_card_item.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../blocs/shift_homepage_bloc.dart';
import '../../../model/shift_list_response.dart';
import '../../../model/user_get_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../manager/home/shift_detail_manager.dart';
import '../../widgets/buttons/drawable_button.dart';
import '../../widgets/buttons/home_button.dart';
import '../app_bar.dart';
import '../detail/shift_detail.dart';
import '../side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreentate extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int devicePixelRatio = 3;
  int perPageItem = 3;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;

  late PageController pageController;

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    getToken();
    homepageBloc.fetchHomepage();
    pageController = PageController(initialPage: 0);
    pageCount = 3;
    // TODO: implement initState
    // getPercentage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Next Shift',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SFProMedium",
                    ),
                  ),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 22, 5, 22),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Constants.colors[4],
                                        Constants.colors[3],
                                      ]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        '18',
                                        textAlign: TextAlign.center,
                                        minFontSize: 0,
                                        stepGranularity: 0.2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontFamily: "SFProBold",
                                            fontWeight: FontWeight.w800),
                                      ),
                                      AutoSizeText(
                                        'Jan,21',
                                        minFontSize: 2,
                                        stepGranularity: 1,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp,
                                            fontFamily: "SFProMedium",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth(context, dividedBy: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Springfeild Hospital',
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Constants.colors[11],
                                      fontSize: 16.sp,
                                      fontFamily: "SFProMedium",
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  'Jan 18,2022 | 11.00Am - 2.00PM',
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12.sp,
                                      fontFamily: "S",
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    DrawableButton(
                                      onPressed: () {},
                                      label: "SW#IP 3RT",
                                      asset:
                                          "assets/images/icon/swipe-to-right.svg",
                                      backgroundColor: Constants.colors[2],
                                      textColors: Constants.colors[4],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    DrawableButton(
                                      onPressed: () {},
                                      label: "Ward 7",
                                      asset: "assets/images/icon/ward.svg",
                                      backgroundColor: Constants.colors[2],
                                      textColors: Constants.colors[6],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                              alignment: Alignment.centerRight,
                              transformAlignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                  'assets/images/icon/righarrow.svg')),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  equalSizeButtons(),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  imageCard(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: AutoSizeText(
                        "Important Update",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                  ),
                  horizontalList(),
                  horizontalIndiCator(),
                  gridView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget equalSizeButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: HomeButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShiftDetailScreen()),
                );



              },
              label: "Shift Details",
              asset: "assets/images/icon/availability.svg",
              textColors: Constants.colors[0],
              color1: Constants.colors[3],
              color2: Constants.colors[4]),
        ),
        SizedBox(width: screenHeight(context, dividedBy: 100)),
        Expanded(
          child: HomeButton(
              onPressed: () {},
              label: "Add to Calender",
              asset: "assets/images/icon/availability.svg",
              textColors: Constants.colors[0],
              color1: Constants.colors[6],
              color2: Constants.colors[5]),
        ),
      ],
    );

  }

  Widget imageCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  "Premium / Immediate \nShifts",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  transformAlignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 3,
                  child: SvgPicture.asset('assets/images/icon/logo.svg')),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget horizontalList() {
    return Column(
      children: [
        Container(

          child:  ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: 110,
    ),

            child: StreamBuilder(
                stream: homepageBloc.allShift,
                builder:
                    (BuildContext context, AsyncSnapshot<SliftListRepso> snapshot) {
                  if (snapshot.hasData) {
                    return buildList(snapshot);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ),

      ],
    );
  }

  Widget buildList(AsyncSnapshot<SliftListRepso> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.response?.data?.category?.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var name = "Shift Reminder";
        var description = "Your shift at Beneavin Manor is in  1 hour";

        var category = snapshot.data?.response?.data?.category![index];
        if (category != null) {
          name = category.categoryname!;
          name = category.categoryname!;
        }

        return Card(
          child: Column(
            children: [
              horizontalList(),
              SizedBox(height: screenHeight(context, dividedBy: 100)),
            ],
          ),
        );
      },
    );
  }

  
  Widget horizontalIndiCator() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: SizedBox(
        height: 15,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue
                        .withOpacity(selectedIndex == index ? 1 : 0.5)),
                margin: EdgeInsets.all(5),
                width: 10,
                height: 10,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget gridView() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 2,
        primary: false,
        crossAxisCount: 2,
        children: [
          HomeCardItem(
              label: "My\nAvailability ",
              asset: "assets/images/icon/availability.svg"),
          HomeCardItem(
              label: "Submit\nTimeSheets ",
              asset: "assets/images/icon/availability.svg"),
          HomeCardItem(
              label: "Find Shift",
              asset: "assets/images/icon/availability.svg"),
          HomeCardItem(
              label: "My\nBooking",
              asset: "assets/images/icon/availability.svg")
        ],
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


getToken() async {
  final prefs= await SharedPreferences.getInstance();
  var token = prefs.getString(SharedPrefKey.AUTH_TOKEN);
  print("TOKEN"+token!);
}

