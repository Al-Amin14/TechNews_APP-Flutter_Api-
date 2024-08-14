import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/components/components.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMybottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: appcolors.back,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

_lunchURL(var url) async {
    await launch(url);
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomSheetLayout(
      {super.key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(children: [
        BottomSheetImage(imageurl: imageurl, title: title,),
        Container(
          padding: EdgeInsets.all(20),
          child: normal_text_description(
            text: description,
            size: 16,
            color: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Read FUll Article',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _lunchURL(url);
                  },
                style: GoogleFonts.poppins(color: Colors.blue.shade400),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
