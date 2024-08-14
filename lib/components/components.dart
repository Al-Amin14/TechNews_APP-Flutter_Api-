import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class DividerWidget extends StatelessWidget {
  final imageurl, title;
  const DividerWidget({super.key, this.imageurl, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: appcolors.lightwhite,
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageurl, title;
  const BottomSheetImage(
      {super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * 1;
    final w = MediaQuery.sizeOf(context).width * 1;
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(imageurl), fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                alignment: Alignment.bottomLeft,
                height: h*0.2,
                width:w,
                padding: EdgeInsets.all(8),
                child: boldText(
                  text: title,
                  size: 18,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
