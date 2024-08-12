import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{
  const appbar({super.key}):preferredSize=const Size.fromHeight(50.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: appcolors.back,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(text: 'Tech', size: 20, color: appcolors.primary_color),
            normal_text(text: 'Newz', size: 20, color: appcolors.lightwhite)
          ],
        ),
      ),
    );
  }
}