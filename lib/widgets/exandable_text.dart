// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';
import 'package:homefood/widgets/small_text.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  const ExandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt(),
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          secondHalf.isEmpty
              ? SmallText(
                text: firstHalf,
                size: Dimensions.font16,
                color: AppColors.paraColor,
              )
              : Column(
                children: [
                  SmallText(
                    height: 1.8,
                    color: AppColors.paraColor,
                    size: Dimensions.font16,
                    text:
                        hiddenText
                            ? (firstHalf + "...")
                            : (firstHalf + secondHalf),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText ? "Xem thêm" : "thu gọn",
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
