import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/utils/validator.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../blocs/profile_update_bloc.dart';
import '../../../model/country_list.dart';
import '../../../model/gender_list.dart';
import '../../../model/visa_type_list.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/login_button.dart';
import '../../widgets/input_text.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

List<GenderList> genderList = [];

class _CreateShiftState extends State<ProfileEditScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var genderId = 1 ;
  var nationalityId = 1;
  var visatypeId =1;
  ToastMsg toastMsg = ToastMsg();
  bool isLoading = false;
  TextEditingController date =  TextEditingController();
  TextEditingController gender =  TextEditingController();
  TextEditingController dob =  TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController phonenumber =  TextEditingController();
  TextEditingController ppsnumber =  TextEditingController();
  TextEditingController bank_iban =  TextEditingController();
  TextEditingController bank_bic =  TextEditingController();
  TextEditingController email =  TextEditingController();
  TextEditingController bank_details =  TextEditingController();
  TextEditingController first_name =  TextEditingController();
  TextEditingController last_name =  TextEditingController();
  TextEditingController nationality =  TextEditingController();
  TextEditingController home_address = TextEditingController();
  TextEditingController visa_type = TextEditingController();
  //updstaes
  TextEditingController permission_to_work_in_ireland =
      new TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc.getUserInfo();
    profileBloc.getDropDownValues();
    listner();
    observerResponse();


  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.colors[9],
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: formKey,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 10, 0, 0),
                                              child: AutoSizeText(
                                                'Update Profile ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "SFProMedium",
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Column(
                                                children: [
                                                  Stack(

                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.22,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width *
                                                                  0.22),
                                                          child: AspectRatio(
                                                            aspectRatio: 1 / 1,
                                                            child:
                                                                Image.network(
                                                              'https://i.imgur.com/PJpPD6S.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                65, 70, 0, 0),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.05,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                                child:
                                                                    AspectRatio(
                                                                  aspectRatio:
                                                                      1 / 1,
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/images/icon/edittool.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 25,
                                            ),


                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: TextInputFileds(
                                                        controlr:
                                                            first_name,
                                                        onTapDate: () {},
                                                        validator: (name) {
                                                          if (validfirstname(
                                                              name))
                                                            return null;
                                                          else {
                                                            return "enter firstname";
                                                          }
                                                        },
                                                        hintText:
                                                            Txt.first_name,
                                                        keyboadType:
                                                            TextInputType
                                                                .text,
                                                        isPwd: false)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: TextInputFileds(
                                                    controlr: last_name,
                                                    validator: (name) {
                                                      if (validlastname(
                                                          name))
                                                        return null;
                                                      else {
                                                        return "enter last name";
                                                      }
                                                    },
                                                    hintText: Txt.last_name,
                                                    keyboadType:
                                                        TextInputType.text,
                                                    isPwd: false,
                                                    onTapDate: () {},
                                                  ),
                                                ),
                                              ],
                                            ),


                                            Row(
                                              children: [

                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 50.w,
                                                    child: StreamBuilder(
                                                      stream: profileBloc
                                                          .countryStream,
                                                      builder: (context,
                                                          AsyncSnapshot<
                                                              List<
                                                                  CountryList>>
                                                          snapshot) {
                                                        print(
                                                            "snapshot.data?.length");
                                                        print(snapshot
                                                            .data
                                                            ?.length);
                                                        if (null ==
                                                            snapshot
                                                                .data ||
                                                            snapshot.data
                                                                ?.length ==
                                                                0) {
                                                          return Container();
                                                        }

                                                        return DropdownButtonFormField(
                                                          value: nationalityId,
                                                          decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(5)),
                                                                borderSide:
                                                                BorderSide(
                                                                    color:
                                                                    Colors.grey),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(Radius.circular(
                                                                      5.0)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                      1)),
                                                              contentPadding:
                                                              EdgeInsets
                                                                  .all(
                                                                  3.0),
                                                              labelText:
                                                              "Nationality",
                                                              labelStyle:
                                                              TextStyle(fontSize: 10.sp)
                                                          ),
                                                          items: snapshot
                                                              .data
                                                              ?.map(
                                                                  (item) {
                                                                return DropdownMenuItem(
                                                                  child:
                                                                  new Text(
                                                                    item.countryName!,
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight
                                                                            .w500,
                                                                        fontSize: 8
                                                                            .sp,
                                                                        decoration: TextDecoration
                                                                            .none,
                                                                        color:
                                                                        Colors.grey),
                                                                  ),
                                                                  value: item.rowId,
                                                                );
                                                              }).toList(),
                                                          onChanged:
                                                              (Object?
                                                          value) {
                                                            if (value
                                                            is CountryList) {
                                                              print(
                                                                  "value");
                                                              print(value
                                                                  ?.rowId);
                                                              print(value
                                                                  ?.countryName);

                                                              nationalityId =
                                                              value
                                                                  .rowId!;
                                                            }
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 15,
                                            ),

                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child: StreamBuilder(
                                                          stream: profileBloc
                                                              .genderStream,
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                  List<
                                                                      GenderList>>
                                                              snapshot) {
                                                            print(
                                                                "snapshot.data?.length");
                                                            print(snapshot
                                                                .data
                                                                ?.length);
                                                            if (null ==
                                                                snapshot
                                                                    .data ||
                                                                snapshot.data
                                                                    ?.length ==
                                                                    0) {
                                                              return Container();
                                                            }

                                                            return DropdownButtonFormField(
value: genderId,
                                                              decoration:
                                                              InputDecoration(
                                                                enabledBorder:
                                                                OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(5)),
                                                                  borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                      Colors.grey),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                    BorderRadius.all(Radius.circular(
                                                                        5.0)),
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                        1)),
                                                                contentPadding:
                                                                EdgeInsets
                                                                    .all(
                                                                    3.0),
                                                                labelText:
                                                                "Gender",
                                                              ),
                                                              items: snapshot
                                                                  .data
                                                                  ?.map(
                                                                      (item) {
                                                                    return DropdownMenuItem(
                                                                      child:
                                                                      new Text(
                                                                        item.gender!,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontSize: 8
                                                                                .sp,
                                                                            decoration: TextDecoration
                                                                                .none,
                                                                            color:
                                                                            Colors.grey),
                                                                      ),
                                                                      value: item.rowId,
                                                                    );
                                                                  }).toList(),
                                                              onChanged:
                                                                  (Object?
                                                              value) {
                                                                if (value
                                                                is GenderList) {
                                                                  genderId = value
                                                                      .rowId!;
                                                                }
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),


                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 50.w,
                                                        child: StreamBuilder(
                                                          stream: profileBloc
                                                              .visatypeStream,
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                  List<
                                                                      VisaTypeList>>
                                                              snapshot) {
                                                            print(
                                                                "snapshot.data?.length");
                                                            print(
                                                                snapshot.data?.length);
                                                            if (null == snapshot.data ||
                                                                snapshot.data?.length ==
                                                                    0) {
                                                              return Container();
                                                            }

                                                            return DropdownButtonFormField(
                                                              value: visatypeId,
                                                              decoration:
                                                              InputDecoration(
                                                                enabledBorder:
                                                                OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius
                                                                          .circular(
                                                                          5)),
                                                                  borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .all(Radius
                                                                        .circular(
                                                                        8.0)),
                                                                    borderSide:
                                                                    BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width: 1)),
                                                                contentPadding:
                                                                EdgeInsets.all(3.0),
                                                                labelText: "Visa Type ",
                                                              ),
                                                              items: snapshot.data
                                                                  ?.map((item) {
                                                                return DropdownMenuItem(
                                                                  child: new Text(
                                                                    item.type!,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 8.sp,
                                                                        decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                  value: item.rowId,
                                                                );
                                                              }).toList(),
                                                              onChanged:
                                                                  (Object? value) {
                                                                if (value
                                                                is VisaTypeList) {
                                                                  print("value");
                                                                  print(value?.rowId);
                                                                  print(value?.type);

                                                                  visatypeId =
                                                                  value.rowId!;
                                                                }
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 15,
                                            ),


                                            TextInputFileds(
                                                controlr: phonenumber,
                                                onTapDate: () {},
                                                validator: (number) {
                                                  if (validphonenumber(
                                                      number))
                                                    return null;
                                                  else
                                                    return "enter phone number";
                                                },
                                                hintText:
                                                Txt.phone_number,
                                                keyboadType:
                                                TextInputType
                                                    .number,
                                                isPwd: false),
                                            TextInputFileds(
                                                controlr: date,
                                                validator: (dob) {
                                                  if (validDate(dob))
                                                    return null;
                                                  else
                                                    return "select dob";
                                                },
                                                onTapDate: () {
                                                  _selectDate(
                                                      context, date);
                                                  print("values");
                                                },
                                                hintText: Txt.dob,
                                                keyboadType:
                                                TextInputType
                                                    .none,
                                                isPwd: false),


                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: home_address,
                                                      onTapDate: () {},
                                                      validator: (address) {
                                                        if (validadress(
                                                            address))
                                                          return null;
                                                        else
                                                          return "enter your address";
                                                      },
                                                      hintText: Txt.address,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),






                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: email,
                                                      onTapDate: () {},
                                                      validator: (number) {
                                                        if (validEmail(number))
                                                          return null;
                                                        else
                                                          return "enter email";
                                                      },
                                                      hintText: Txt.email,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr:
                                                          permission_to_work_in_ireland,
                                                      validator: (permission) {
                                                        if (vaidpermission_to_work_in_ireland(
                                                            permission))
                                                          return null;
                                                        else
                                                          return "enter permission";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt
                                                          .permission_to_work_in_ireland,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: ppsnumber,
                                                      validator: (permission) {
                                                        if (validppsnumber(
                                                            permission))
                                                          return null;
                                                        else
                                                          return "enter pps number";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.pps_number,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: bank_iban,
                                                      validator: (number) {
                                                        if (validbankiban(
                                                            number))
                                                          return null;
                                                        else
                                                          return "enter bankiban";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.bankiban,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: bank_bic,
                                                      validator: (number) {
                                                        if (validbankbic(
                                                            number))
                                                          return null;
                                                        else
                                                          return "enter bankbic";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.bankbic,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),


                                            signUpBtn(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpBtn() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Visibility(
            visible: !visible,
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Stack(
                children: [
                  LoginButton(
                      onPressed: () async {


                        final prefs = await SharedPreferences.getInstance();
                        var auth_tokn =
                        prefs.getString(SharedPrefKey.AUTH_TOKEN);
                        print("for validation");
                        print(auth_tokn);


                        var validate = formKey.currentState?.validate();
                        if (null != validate) {
                          if (validate) {
                            if (null != auth_tokn) {


                              setState(() {
                                visible = true;
                              });
                              print("after validation");
                              profileBloc.ProfileUser(

                                  auth_tokn,

                                  first_name.text,
                                  last_name.text,
                                  date.text,
                                  genderId.toString(),
                                  nationalityId.toString(),
                                  home_address.text,
                                  permission_to_work_in_ireland.text,
                                  visatypeId.toString(),
                                  phonenumber.text,
                                  email.text,
                                  ppsnumber.text,
                                  bank_iban.text,
                                  bank_bic.text);
                            }
                          }
                          // use the information provided
                        }
                        //showFeactureAlert(context, date: "");
                        // use the information provided
                      },
                      label: "SUBMIT"),
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
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  void listner() {
    profileBloc.getProfileStream.listen((event) {
      print("Profile Stream");
      if (null != event.userResponse?.data?.items?[0]) {
        var item = event.userResponse?.data?.items?[0];
        if (null != item) {

          if(item.genderId!=0)
          {
            setState(() {
              genderId = item.genderId!;
            });
          }
          if(item.visaTypeId !=0)
          {
            setState(() {
              visatypeId = item.visaTypeId!;
            });
          }


          if(item.nationalityId!=0)
          {
            setState(() {
              nationalityId =item.nationalityId!;
            });
          }


          first_name.text = item.firstName!;
          last_name.text = item.lastName!;
          date.text = item.dob!;
          email.text =item.email!;



          permission_to_work_in_ireland.text = item.firstName!;

          phonenumber.text = item.phoneNumber!;
          ppsnumber.text = item.ppsNumber!;
          bank_iban.text = item.bankIban!;
          bank_bic.text = item.bankBic!;
          ppsnumber.text = item.ppsNumber!;
          home_address.text = item.homeAddress!;



        }
      }
    });
  }

  void observerResponse() {
    profileBloc.profileStream.listen((event) {
      print("RESPONSE FROM ui");
      setState(() {
        visible = false;
      });
      print(event.response?.status?.statusMessage.toString());
      print(event.response?.status?.statusCode);
      var message = event?.response?.status?.statusMessage.toString();
      if (event.response?.status?.statusCode == 200) {
        Navigator.pop(context);
      } else {
        showAlertDialoge(context,
            title: "Invalid", message: message!);
      }
    });
  }
}

_selectDate(BuildContext context, TextEditingController dateController) async {
  print("date");
  final DateTime? newDate = await showDatePicker(
  context: context,
  initialDatePickerMode: DatePickerMode.day,
  initialDate: DateTime.now(),
  firstDate: DateTime.now(),
  lastDate: DateTime(2025),
  helpText: 'Select a date',
  fieldHintText: "dd-MM-yyyy",
  );
  if (newDate != null) {
    print(newDate);
    var dates = DateFormat('dd-MM-yyyy').format(newDate);
    dateController.text = dates;
  }
}
