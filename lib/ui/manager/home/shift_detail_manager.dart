import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/ui/user/detail/shift_rows.dart';
import 'package:xpresshealthdev/ui/widgets/loading_widget.dart';

import '../../../../utils/constants.dart';
import '../../../Constants/sharedPrefKeys.dart';
import '../../../blocs/manager_view_detail.dart';
import '../../../model/manager_view_request.dart';
import '../../../utils/utils.dart';
import '../../user/detail/drawable_custom_row.dart';
import '../../widgets/request_user_list.dart';
class ShiftDetailManagerScreen extends StatefulWidget {


  final String shift_id;
  const ShiftDetailManagerScreen({Key? key, required this.shift_id}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}
class _CreateShiftState extends State<ShiftDetailManagerScreen> {
  String? token;
//  String? shift_id = "190";
  String? job_request_row_id;
  bool visible = false;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future getData() async {
    SharedPreferences shdPre = await SharedPreferences.getInstance();
    token = shdPre.getString(SharedPrefKey.AUTH_TOKEN);
    print("token inn deta");
    print(token);
    print(widget.shift_id);
    managerviewrequestBloc.fetchManagerViewRequest(token!, widget.shift_id);
    acceptjobrequestBloc.fetchAcceptJobRequestResponse(
        token!, job_request_row_id!);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Constants.colors[9],
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: managerviewrequestBloc.managerviewrequest,
            builder:
                (context, AsyncSnapshot<ManagerViewRequestResponse> snapshot) {
              if (snapshot.data?.response?.data != null) {
                var data = snapshot.data?.response?.data;
                var hospitalDetail = data?.hospitalDetails![0];
                var shiftDetails = data?.shiftDetails![0];
                var jobRequestDetails = data?.jobRequestDetails![0];

                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Column(
                        children: [
                          if (null != hospitalDetail)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 30.h,
                                  child: SizedBox.fromSize(
                                      size: Size.fromRadius(10), // Image radius
                                      child: Image.network(
                                        hospitalDetail.photo!,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          if (null != hospitalDetail)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 14, top: 10),
                                                child: Text(
                                                  "At. " +
                                                      hospitalDetail
                                                          .hospitalName
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.sp,
                                                      fontFamily: "SFProMedium",
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              CustomRow(
                                                onPressed: () {},
                                                label: "Address: " +
                                                    hospitalDetail.address
                                                        .toString(),
                                                asset:
                                                    "assets/images/icon/location.svg",
                                                textColors: Colors.black,
                                                size: 9.sp,
                                              ),
                                              if (null != shiftDetails)
                                                CustomRow(
                                                  onPressed: () {},
                                                  label: "From " +
                                                      shiftDetails.timeFrom
                                                          .toString() +
                                                      "AM To " +
                                                      shiftDetails.timeFrom
                                                          .toString() +
                                                      " PM",
                                                  asset:
                                                      "assets/images/icon/time.svg",
                                                  textColors: Colors.black,
                                                  size: 9.sp,
                                                ),
                                              CustomRow(
                                                onPressed: () {},
                                                label: hospitalDetail
                                                    .hospitalName
                                                    .toString(),
                                                asset:
                                                    "assets/images/icon/ward.svg",
                                                textColors: Colors.black,
                                                size: 9.sp,
                                              ),
                                              CustomRow(
                                                onPressed: () {},
                                                label: hospitalDetail.email
                                                    .toString(),
                                                asset:
                                                    "assets/images/icon/email.svg",
                                                textColors: Colors.black,
                                                size: 9.sp,
                                              ),
                                              CustomRow(
                                                onPressed: () {},
                                                label: hospitalDetail.phone
                                                    .toString(),
                                                asset:
                                                    "assets/images/icon/price-tag.svg",
                                                textColors: Colors.black,
                                                size: 9.sp,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Divider(
                                                  thickness: 1,
                                                  indent: 12,
                                                  endIndent: 12,
                                                ),
                                              ),
                                              if (null != shiftDetails)
                                                CustomRowz(
                                                  onPressed: () {},
                                                  label: "Date : " +
                                                      shiftDetails.date
                                                          .toString(),
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                ),
                                              if (null != shiftDetails)
                                                CustomRow(
                                                  onPressed: () {},
                                                  label: "From : " +
                                                      shiftDetails.timeFrom
                                                          .toString() +
                                                      "AM To : " +
                                                      shiftDetails.timeFrom
                                                          .toString() +
                                                      " PM",
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                  size: 9.sp,
                                                ),
                                              if (null != shiftDetails)
                                                CustomRowz(
                                                  onPressed: () {},
                                                  label: "Price : " +
                                                      shiftDetails.price
                                                          .toString(),
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                ),
                                              if (null != shiftDetails)
                                                CustomRowz(
                                                  onPressed: () {},
                                                  label: "Category : " +
                                                      shiftDetails.category
                                                          .toString(),
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                ),
                                              if (null != shiftDetails)
                                                CustomRowz(
                                                  onPressed: () {},
                                                  label: "UserType : " +
                                                      shiftDetails.userType
                                                          .toString(),
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                ),
                                              if (null != shiftDetails)
                                                CustomRowz(
                                                  onPressed: () {},
                                                  label: "Shift ype : " +
                                                      shiftDetails.type
                                                          .toString(),
                                                  asset:
                                                      "assets/images/icon/check.svg",
                                                  textColors: Colors.black,
                                                ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Container(
                                                  child: Text(
                                                    "Shift Request From Users",
                                                    style: TextStyle(
                                                        fontSize: 11.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              ListView.builder(
                                                itemCount: snapshot
                                                    .data!
                                                    .response!
                                                    .data!
                                                    .jobRequestDetails!
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  var name =
                                                      "Approved time sheet";
                                                  var description =
                                                      "timesheets";
                                                  return Column(
                                                    children: [
                                                      RequestuserListWidget(
                                                        onTapView: () {},
                                                        onTapCall: () {},
                                                        onTapMap: () {},
                                                        onTapBooking:
                                                            (JobRequestDetails
                                                                item) {
                                                          print("Tapped");
                                                          print(item.jobId);
                                                          print(item.userName);
                                                          print(item.userId);


                                                          acceptjobrequestBloc
                                                              .fetchAcceptJobRequestResponse(
                                                                  token!,
                                                                  item.jobId
                                                                      .toString());
                                                          // showBookingAlert(context, date: "Show Timesheet");
                                                        },
                                                        item: snapshot
                                                                .data!
                                                                .response!
                                                                .data!
                                                                .jobRequestDetails![
                                                            index],
                                                      ),
                                                      SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 100)),
                                                    ],
                                                  );
                                                },
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
                    ),
                  ],
                );
              } else {
                return Container(
                  width: 100.w,
                  height: 80.h,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
