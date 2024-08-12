import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/bacnend/fetching.dart';
import 'package:tech_news_app/utils/colors.dart';

class SerchBar extends StatefulWidget {
  const SerchBar({super.key});
  static TextEditingController serchBarState = TextEditingController();

  @override
  State<SerchBar> createState() => _SerchBarState();
}

class _SerchBarState extends State<SerchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: appcolors.darkgrey,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  controller: SerchBar.serchBarState,
                  decoration: InputDecoration(
                      hintText: 'Search a keyword or a phrase',
                      hintStyle: GoogleFonts.poppins(),
                      border: InputBorder.none),
                ))
              ],
            ),
          ),
        )),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchingNews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: appcolors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: appcolors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
