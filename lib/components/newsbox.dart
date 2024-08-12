import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/components/components.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class NewsBox extends StatefulWidget {
  final url, imageurl, description, title, time;
  const NewsBox(
      {super.key,
      this.url,
      this.imageurl,
      this.description,
      this.title,
      this.time});

  @override
  State<NewsBox> createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return Material(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                width: w,
                color: appcolors.back,
                child: Row(children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageurl,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow),
                      );
                    },
                    placeholder: (contex, url) => CircularProgressIndicator(
                      color: appcolors.primary_color,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normal_text(
                          text: widget.title, size: 16, color: appcolors.white),
                      SizedBox(
                        height: 5,
                      ),
                      normal_text(
                          text: widget.time,
                          size: 12,
                          color: appcolors.lightwhite)
                    ],
                  ))
                ]),
              ),
            ),
            const DividerWidget(),
          ],
        ),
      ),
    );
  }
}
