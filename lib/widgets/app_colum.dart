// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/icon_and_text_widget.dart';
import 'package:homefood/widgets/small_text.dart';

class AppColum extends StatelessWidget {
  final String text;
  const AppColum({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        //name

        //comments, rate
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: AppColors.mainColor, size: 15),
              ),
            ),
            SizedBox(width: 10),
            SmallText(text: '5'),
            SizedBox(width: 10),
            SmallText(text: '128 binh luan'),
          ],
        ),

        //comments, rate

        //icon vi tri
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon1
            IconAndTextWidget(
              icon: Icons.circle_notifications_sharp,
              text: "binh thuong",
              iconColor: AppColors.iconColor1,
            ),
            //icon2
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1,7km",
              iconColor: AppColors.mainColor,
            ),
            //icon3
            IconAndTextWidget(
              icon: Icons.access_time,
              text: "32min ",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
