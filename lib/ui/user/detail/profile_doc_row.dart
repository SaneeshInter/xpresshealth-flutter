import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/app_defaults.dart';
import '../../../utils/constants.dart';
import '../../widgets/buttons/drawable_button.dart';

class ProfileDocRow extends StatefulWidget {
  final String label;
  final String asset;

  const ProfileDocRow({
    Key? key,
    required this.label,
    required this.asset,
  }) : super(key: key);

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<ProfileDocRow> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: AutoSizeText(
                  widget.label,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontFamily: "SFProMedium",
                  ),
                  maxLines: 2,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    height: 3.w,
                    width: 3.w,
                    child: SvgPicture.asset(
                      widget.asset,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
