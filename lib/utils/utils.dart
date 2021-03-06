import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';

import '../ui/Widgets/booking_alert_box.dart';
import '../ui/widgets/add_time_sheet_alert_box.dart';
import '../ui/widgets/login_invalid_alert.dart';

double screenHeight(context, {required double dividedBy}) {
  getPercentage(context);
  return MediaQuery.of(context).size.height / dividedBy;
}

double commonButtonHeight(context) {
  return 5.5.h;
}

double screenWidth(context, {required double dividedBy}) {
  return MediaQuery.of(context).size.width / dividedBy;
}

void push(context, Widget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

double getPercentage(context) {
  var height = MediaQuery.of(context).size.height;

  if (height > 1024) {
    return 10.h;
  } else {
    return 20.h;
  }
}

void pop(context) {
  Navigator.pop(context);
}

String formatDate(DateTime now) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  return formatted;
}

void showBookingAlert(
  context, {
  required String date,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: BookingAlertBox(
              date: date,
              key: null,
            )),
      );
    },
  );
}

void showAddTimeSheet(
  context, {
  required String date,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: AddTimeSheetAlertBox(
              date: date,
              key: null,
            )),
      );
    },
  );
}

void showAlertDialoge(
  context, {
  required String message,
  required String title,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: LoginAlertBox(
              title: title,
              message: message,
              key: null,
            )),
      );
    },
  );
}


selectDate(
    BuildContext context, TextEditingController dateController) async {
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

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Colors.white,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

selectTime(BuildContext context, TextEditingController anycontroller) async {
  print("time");

  final TimeOfDay? timeOfDay = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.input,
    confirmText: "CONFIRM",
    cancelText: "NOT NOW",
    helpText: "BOOKING TIME",
  );

  if (timeOfDay != null) {
    anycontroller.text = timeOfDay.format(context);
  }
}

// Future<void> datepicker(
// context,{
//   required String date,})
// async {
//   final DateTime? newDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime(2020, 11, 17),
//     firstDate: DateTime(2017, 1),
//     lastDate: DateTime(2022, 7),
//     helpText: 'Select a date',
//   );
// }
//
//
// void showActionAlert(
//     context, {
//       required String tittle,
//       required String message,
//     }) {
//   showDialog(
//     context: context,
//     barrierColor: Colors.transparent,
//     builder: (BuildContext context) {
//       Future.delayed(Duration(seconds: 2), () {
//         // Navigator.of(context).pop(true);
//       });
//       return Center(
//         child: AlertDialog(
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             insetPadding: EdgeInsets.symmetric(
//               horizontal: screenWidth(context, dividedBy: 30),
//             ),
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             content: ActionAlertBox(
//                 tittle: tittle,
//                 message: message,
//                 positiveText: "DELETE",
//                 onPositvieClick: () {},
//                 onNegativeClick: () {})),
//       );
//     },
//   );
// }
