import 'package:flutter/material.dart';
import 'package:homefood/widgets/Big_text.dart';
import 'package:homefood/widgets/Home_appBar.dart';

class HomeFood extends StatelessWidget {
  const HomeFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [HomeAppbar()]));
  }
}
