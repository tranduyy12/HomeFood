// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:homefood/utils/colors.dart';
import 'package:homefood/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscureText = false,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 3,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        obscureText: isObscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,

        decoration: InputDecoration(
          // labelText: "Email",
          hintText: hintText,
          prefixIcon: Icon(icon, color: AppColors.yellowColor),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
