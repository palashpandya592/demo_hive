import 'package:flutter/material.dart';
import 'package:hive_demo/utils/app_string.dart';
import 'package:hive_demo/utils/common_color.dart';
import 'package:hive_demo/utils/common_textStyle.dart';

class CommonRowData extends StatelessWidget {
  final String? coinName;
  final String? coinValue;
  const CommonRowData({Key? key, this.coinName, this.coinValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
      child: Row(
        children: [
          CommonTextStyle.label(text: coinValue!,size: 12.0,color: AppColor.lightSky,fontWeight: FontWeight.w500),
          const SizedBox(width: 3,),
          CommonTextStyle.label(text: coinName!,size: 9.0,color: AppColor.grey,fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
