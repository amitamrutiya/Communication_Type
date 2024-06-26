import 'package:Comm_type/constant/app_colors.dart';
import 'package:Comm_type/constant/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double? size;
  TextOverflow? overFlow;
  FontWeight? fontWeight;
  BigText(
      {Key? key,
      this.color = AppColors.primaryTextColor,
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis,
      FontWeight? fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: 'Lora',
      ),
      softWrap: true,
    );
  }
}
